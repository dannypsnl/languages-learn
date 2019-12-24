package main

import (
	"bytes"
	"go/ast"
	"go/printer"
	"go/token"

	"golang.org/x/tools/go/analysis"
	"golang.org/x/tools/go/analysis/singlechecker"
)

func main() {
	singlechecker.Main(Analyzer)
}

var Analyzer = &analysis.Analyzer{
	Name: "unusedresult",
	Doc:  "check for unused results of calls to some functions",
	Run:  run,
}

func run(pass *analysis.Pass) (interface{}, error) {
	for _, file := range pass.Files {
		ast.Inspect(file, func(n ast.Node) bool {
			f, ok := n.(*ast.FuncDecl)
			if !ok {
				return true
			}
			if f.Type.Results == nil {
				return true
			}
			for _, r := range f.Type.Results.List {
				if len(r.Names) != 0 {
					pass.Reportf(f.Pos(), "function has named return parameters %q", render(pass.Fset, f))
					return false
				}
			}
			return true
		})
	}

	return nil, nil
}

// render returns the pretty-print of the given node
func render(fset *token.FileSet, x ast.Node) string {
	var buf bytes.Buffer
	if err := printer.Fprint(&buf, fset, x); err != nil {
		panic(err)
	}
	return buf.String()
}
