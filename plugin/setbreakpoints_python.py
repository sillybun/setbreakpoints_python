import re


def create_import(code):
    if 'from pdb import set_trace' in code:
        return (code, False)
    return (["from pdb import set_trace"] + code, True)


def remove_import(code):
    for row in code:
        if re.search('set_trace\(\)', row) is not None:
            return (code, False)
    return ([row for row in code if row != 'from pdb import set_trace'], True)


def remove_set_trace(code):
    return [row for row in code if re.search('set_trace\(\)', row) is None]


def remove_breakpoints(code):
    return (remove_import(remove_set_trace(code)))[0]
