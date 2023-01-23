from pygments.style import Style
from pygments.token import Comment, Keyword, Name, String, Generic, Number, Operator, Literal, Punctuation

class AwesomeStyle(Style):
    #a51d2d
    styles = {
        Keyword: '#a51d2d',
        # Keyword.Constant: '',
        # Keyword.Declaration: '',
        # Keyword.Namespace: '',
        # Keyword.Pseudo: '',
        # Keyword.Reserved: '',
        # Keyword.Type: '',

        Name: '#000000',
        # Name.Attribute: '',
        Name.Builtin: '#a51d2d',
        # Name.Class: '',
        # Name.Constant: '',
        # Name.Decorator: '',
        # Name.Entity: '',
        # Name.Exception: '',
        # Name.Function: '',
        # Name.Function.Magic: '',
        # Name.Label: '',
        # Name.Namespace: '',
        # Name.Other: '',
        # Name.Property: '',
        # Name.Tag: '',
        # Name.Variable: '',
        # Name.Variable.Class: '',
        # Name.Variable.Global: '',
        # Name.Variable.Instance: '',
        # Name.Variable.Magic: '',

        Literal: '#1a5fb4',
        # Literal.Date: '',
        # String: '',
        # String.Affix: '',
        # String.Backtick: '',
        # String.Char: '',
        # String.Delimiter: '',
        # String.Doc: '',
        # String.Double: '',
        # String.Escape: '',
        # String.Heredoc: '',
        # String.Interpol: '',
        # String.Other: '',
        # String.Regex: '',
        # String.Single: '',
        # String.Symbol: '',
        # Number: '',
        # Number.Bin: '',
        # Number.Float: '',
        # Number.Hex: '',
        # Number.Integer: '',
        # Number.Integer.Long: '',
        # Number.Integer.Oct: '',

        Operator: '#000000',

        Punctuation: '#000000',

        Comment: '#77767b',

        Generic: '#a51d2d'
    }
