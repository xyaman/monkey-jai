#import "Basic";

Token :: struct {
    literal: u8;
    type: TokenType;
}

TokenType :: enum {
    ILLEGAL;
    EOF;

    // identifiers + literals
    IDENT;
    INT;

    // operators
    ASSIGN;
    PLUS;

    // delimeters
    COMMA;
    SEMICOLON;

    LPAREN;
    RPAREN;
    LBRACE;
    RBRACE;

    // keywords
    FUNCTION;
    LET;
}

Lexer :: struct {
    input: string;
    position: int; // current position in input (points to the current char)
    read_position: int; // current reading position in input (after current char)
    ch: u8; // current char under examination
}

new_lexer :: (input: string) -> Lexer {
    l := Lexer.{
        input = input,
        position = 0,
        read_position = 0,
        ch = 0,
    };

    lexer_read_char(*l);

    return l;
}

lexer_read_char :: (l: *Lexer) {
    if l.position >= l.input.count {
        l.ch = 0;
    } else {
        l.ch = l.input[l.read_position];
        l.position = l.read_position;
        l.read_position += 1;
    }
}

lexer_next_token :: (l: *Lexer) -> Token {
    token: Token;

    if l.ch == {
        case #char "=";
            token = .{l.ch, .ASSIGN};
        case;
            token = .{l.ch, .ILLEGAL};
    }

    lexer_read_char(l);
    return token;
}
