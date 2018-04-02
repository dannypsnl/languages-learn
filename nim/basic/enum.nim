type
    NodeKind = enum
        nkInt,
        nkFloat,
        nkString,
        nkAdd,
        nkSub,
        nkIf
    Node = ref NodeObj
    NodeObj = object
        case kind: NodeKind
        of nkInt: intVal: int
        of nkFloat: floatVal: float
        of nkString: strVal: string
        of nkAdd, nkSub:
            leftOp, rightOp: Node
        of nkIf:
            condition, thenPart, elsePart: Node

var n = Node(kind: nkFloat, floatVal: 3.3)
var exprAdd = Node(kind: nkAdd, leftOp: n, rightOp: n)
echo exprAdd.leftOp.floatVal + exprAdd.rightOp.floatVal
