
type typ = Cduce.typ

type const =
    | CBool of bool
    | CInt of int
    | CString of string

type var = string

type expr =
    | Const of const
    | Var of var
    | Lambda of typ * var * expr
    | Ite of expr * typ * expr * expr
    | App of expr * expr

type dir =
    | LApp | RApp

type path = dir list

module ExprMap : Map.S with type key = expr

exception Invalid_path

val follow_path : expr -> path -> expr
