class tag:
    def __init__(self, tagname: str, newline: bool):
        self.name = tagname
        self.newline = newline
    def __enter__(self):
        s = '<{}>'.format(self.name)
        if self.newline:
            print(s)
        else:
            print(s, end='')
    def __exit__(self, etyp, einst, etb):
        print('</{}>'.format(self.name))

def ident():
    print('  ', end='')

html = tag('html', True)
body = tag('body', True)
h1 = tag('h1', False)
p = tag('p', False)

with html:
    with body:
        ident()
        with h1:
            print('With!!!', end='')
        ident()
        with p:
            print('Hello World', end='')
