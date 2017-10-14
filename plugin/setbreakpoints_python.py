from pdb import set_trace
import re


def create_import(code, pdb):
    if pdb:
        if 'from pdb import set_trace' in code:
            return (code,   False)
        return (["from pdb import set_trace"] + code, True)
    else:
        if 'from pudb import set_trace' in code:
            return (code,   False)
        return (["from pudb import set_trace"] + code, True)


def remove_import(code, pdb):
    for row in code:
        if re.search('set_trace\(\)', row) is not None:
            return (code, False)
    if pdb:
        return ([row for row in code if row != 'from pdb import set_trace'], True)
    else:
        return ([row for row in code if row != 'from pudb import set_trace'], True)


def remove_set_trace(code, pdb):
    return [row for row in code if re.search('set_trace\(\)', row) is None]


def remove_breakpoints(code, pdb):
    return (remove_import(remove_set_trace(code, pdb), pdb))[0]
