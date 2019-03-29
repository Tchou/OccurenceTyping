
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

module Expr = struct type t = expr let compare = compare end
module ExprMap = Map.Make(Expr)

exception Invalid_path

let rec follow_path e p =
    match e, p with
    | e, [] -> e
    | App (e,_), LApp::p
    | App (_,e), RApp::p -> follow_path e p
    | _ -> raise Invalid_path
