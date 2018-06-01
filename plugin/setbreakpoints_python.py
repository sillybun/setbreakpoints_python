import re


def create_import(code, pdb):
    if pdb:
        spdb = 'pdb'
    else:
        spdb = 'ipdb'
    if "from {} import set_trace".format(spdb) in code:
        return (code,   False)
    newcode = [""]
    flag = False
    for row in code:
        if flag:
            newcode = newcode + [row]
        elif len(row) != 0 and row[0] == '#':
            newcode = newcode + [row]
        else:
            newcode = newcode + ["from {} import set_trace".format(spdb)] + [row]
            flag = True
    return (newcode[1:], True)


def remove_import(code, pdb):
    for row in code:
        if re.search('set_trace\(\)', row) is not None:
            return (code, False)
    if pdb:
        return ([row for row in code if row != 'from pdb import set_trace'], True)
    else:
        return ([row for row in code if row != 'from ipdb import set_trace'], True)


def remove_set_trace(code, pdb):
    return [row for row in code if re.search('set_trace\(\)', row) is None]


def remove_breakpoints(code, pdb):
    return (remove_import(remove_set_trace(code, pdb), pdb))[0]
