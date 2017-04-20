
open Prims

let tc_one_file = (fun remaining uenv -> (

let uu____26 = uenv
in (match (uu____26) with
| (dsenv, env) -> begin
(

let uu____40 = (match (remaining) with
| (intf)::(impl)::remaining1 when (FStar_Universal.needs_interleaving intf impl) -> begin
(

let uu____61 = (FStar_Universal.tc_one_file_and_intf (Some (intf)) impl dsenv env)
in (match (uu____61) with
| (uu____76, dsenv1, env1) -> begin
((((Some (intf)), (impl))), (dsenv1), (env1), (remaining1))
end))
end
| (intf_or_impl)::remaining1 -> begin
(

let uu____93 = (FStar_Universal.tc_one_file_and_intf None intf_or_impl dsenv env)
in (match (uu____93) with
| (uu____108, dsenv1, env1) -> begin
((((None), (intf_or_impl))), (dsenv1), (env1), (remaining1))
end))
end
| [] -> begin
(failwith "Impossible")
end)
in (match (uu____40) with
| ((intf, impl), dsenv1, env1, remaining1) -> begin
((((intf), (impl))), (((dsenv1), (env1))), (None), (remaining1))
end))
end)))


let tc_prims : Prims.unit  ->  (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env) = (fun uu____165 -> (

let uu____166 = (FStar_Universal.tc_prims ())
in (match (uu____166) with
| (uu____174, dsenv, env) -> begin
((dsenv), (env))
end)))


type env_t =
(FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env)


type modul_t =
FStar_Syntax_Syntax.modul Prims.option


type stack_t =
(env_t * modul_t) Prims.list


let pop = (fun uu____199 msg -> (match (uu____199) with
| (uu____203, env) -> begin
((FStar_Universal.pop_context env msg);
(FStar_Options.pop ());
)
end))


let push : (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env)  ->  Prims.bool  ->  Prims.bool  ->  Prims.string  ->  (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env) = (fun uu____218 lax1 restore_cmd_line_options1 msg -> (match (uu____218) with
| (dsenv, env) -> begin
(

let env1 = (

let uu___229_229 = env
in {FStar_TypeChecker_Env.solver = uu___229_229.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___229_229.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___229_229.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___229_229.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___229_229.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___229_229.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___229_229.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___229_229.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___229_229.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___229_229.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___229_229.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___229_229.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___229_229.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___229_229.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___229_229.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___229_229.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___229_229.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___229_229.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = lax1; FStar_TypeChecker_Env.lax_universes = uu___229_229.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___229_229.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___229_229.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___229_229.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___229_229.FStar_TypeChecker_Env.qname_and_index})
in (

let res = (FStar_Universal.push_context ((dsenv), (env1)) msg)
in ((FStar_Options.push ());
(match (restore_cmd_line_options1) with
| true -> begin
(

let uu____235 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right uu____235 Prims.ignore))
end
| uu____236 -> begin
()
end);
res;
)))
end))


let mark : (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env)  ->  (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env) = (fun uu____243 -> (match (uu____243) with
| (dsenv, env) -> begin
(

let dsenv1 = (FStar_ToSyntax_Env.mark dsenv)
in (

let env1 = (FStar_TypeChecker_Env.mark env)
in ((FStar_Options.push ());
((dsenv1), (env1));
)))
end))


let reset_mark = (fun uu____263 -> (match (uu____263) with
| (uu____266, env) -> begin
(

let dsenv = (FStar_ToSyntax_Env.reset_mark ())
in (

let env1 = (FStar_TypeChecker_Env.reset_mark env)
in ((FStar_Options.pop ());
((dsenv), (env1));
)))
end))


let cleanup = (fun uu____279 -> (match (uu____279) with
| (dsenv, env) -> begin
(FStar_TypeChecker_Env.cleanup_interactive env)
end))


let commit_mark : (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env)  ->  (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env) = (fun uu____290 -> (match (uu____290) with
| (dsenv, env) -> begin
(

let dsenv1 = (FStar_ToSyntax_Env.commit_mark dsenv)
in (

let env1 = (FStar_TypeChecker_Env.commit_mark env)
in ((dsenv1), (env1))))
end))


let check_frag : (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env)  ->  FStar_Syntax_Syntax.modul Prims.option  ->  (FStar_Parser_ParseIt.input_frag * Prims.bool)  ->  (FStar_Syntax_Syntax.modul Prims.option * (FStar_ToSyntax_Env.env * FStar_TypeChecker_Env.env) * Prims.int) Prims.option = (fun uu____317 curmod frag -> (match (uu____317) with
| (dsenv, env) -> begin
try
(match (()) with
| () -> begin
(

let uu____349 = (FStar_Universal.tc_one_fragment curmod dsenv env frag)
in (match (uu____349) with
| Some (m, dsenv1, env1) -> begin
(

let uu____371 = (

let uu____378 = (FStar_Errors.get_err_count ())
in ((m), (((dsenv1), (env1))), (uu____378)))
in Some (uu____371))
end
| uu____388 -> begin
None
end))
end)
with
| FStar_Errors.Error (msg, r) when (

let uu____410 = (FStar_Options.trace_error ())
in (not (uu____410))) -> begin
((FStar_TypeChecker_Err.add_errors env ((((msg), (r)))::[]));
None;
)
end
| FStar_Errors.Err (msg) when (

let uu____423 = (FStar_Options.trace_error ())
in (not (uu____423))) -> begin
((

let uu____425 = (

let uu____429 = (

let uu____432 = (FStar_TypeChecker_Env.get_range env)
in ((msg), (uu____432)))
in (uu____429)::[])
in (FStar_TypeChecker_Err.add_errors env uu____425));
None;
)
end
end))


let deps_of_our_file : Prims.string  ->  (Prims.string Prims.list * Prims.string Prims.option) = (fun filename -> (

let deps = (FStar_Dependencies.find_deps_if_needed FStar_Parser_Dep.VerifyFigureItOut ((filename)::[]))
in (

let uu____452 = (FStar_List.partition (fun x -> (

let uu____458 = (FStar_Parser_Dep.lowercase_module_name x)
in (

let uu____459 = (FStar_Parser_Dep.lowercase_module_name filename)
in (uu____458 <> uu____459)))) deps)
in (match (uu____452) with
| (deps1, same_name) -> begin
(

let maybe_intf = (match (same_name) with
| (intf)::(impl)::[] -> begin
((

let uu____476 = ((

let uu____477 = (FStar_Parser_Dep.is_interface intf)
in (not (uu____477))) || (

let uu____478 = (FStar_Parser_Dep.is_implementation impl)
in (not (uu____478))))
in (match (uu____476) with
| true -> begin
(

let uu____479 = (FStar_Util.format2 "Found %s and %s but not an interface + implementation" intf impl)
in (FStar_Util.print_warning uu____479))
end
| uu____480 -> begin
()
end));
Some (intf);
)
end
| (impl)::[] -> begin
None
end
| uu____482 -> begin
((

let uu____485 = (FStar_Util.format1 "Unsupported: ended up with %s" (FStar_String.concat " " same_name))
in (FStar_Util.print_warning uu____485));
None;
)
end)
in ((deps1), (maybe_intf)))
end))))


type m_timestamps =
(Prims.string Prims.option * Prims.string * FStar_Util.time Prims.option * FStar_Util.time) Prims.list


let rec tc_deps : modul_t  ->  stack_t  ->  env_t  ->  Prims.string Prims.list  ->  m_timestamps  ->  (stack_t * env_t * m_timestamps) = (fun m stack env remaining ts -> (match (remaining) with
| [] -> begin
((stack), (env), (ts))
end
| uu____518 -> begin
(

let stack1 = (((env), (m)))::stack
in (

let env1 = (

let uu____529 = (FStar_Options.lax ())
in (push env uu____529 true "typecheck_modul"))
in (

let uu____530 = (tc_one_file remaining env1)
in (match (uu____530) with
| ((intf, impl), env2, modl, remaining1) -> begin
(

let uu____563 = (

let intf_t = (match (intf) with
| Some (intf1) -> begin
(

let uu____571 = (FStar_Util.get_file_last_modification_time intf1)
in Some (uu____571))
end
| None -> begin
None
end)
in (

let impl_t = (FStar_Util.get_file_last_modification_time impl)
in ((intf_t), (impl_t))))
in (match (uu____563) with
| (intf_t, impl_t) -> begin
(tc_deps m stack1 env2 remaining1 ((((intf), (impl), (intf_t), (impl_t)))::ts))
end))
end))))
end))


let update_deps : Prims.string  ->  modul_t  ->  stack_t  ->  env_t  ->  m_timestamps  ->  (stack_t * env_t * m_timestamps) = (fun filename m stk env ts -> (

let is_stale = (fun intf impl intf_t impl_t -> (

let impl_mt = (FStar_Util.get_file_last_modification_time impl)
in ((FStar_Util.is_before impl_t impl_mt) || (match (((intf), (intf_t))) with
| (Some (intf1), Some (intf_t1)) -> begin
(

let intf_mt = (FStar_Util.get_file_last_modification_time intf1)
in (FStar_Util.is_before intf_t1 intf_mt))
end
| (None, None) -> begin
false
end
| (uu____637, uu____638) -> begin
(failwith "Impossible, if the interface is None, the timestamp entry should also be None")
end))))
in (

let rec iterate = (fun depnames st env' ts1 good_stack good_ts -> (

let match_dep = (fun depnames1 intf impl -> (match (intf) with
| None -> begin
(match (depnames1) with
| (dep1)::depnames' -> begin
(match ((dep1 = impl)) with
| true -> begin
((true), (depnames'))
end
| uu____700 -> begin
((false), (depnames1))
end)
end
| uu____702 -> begin
((false), (depnames1))
end)
end
| Some (intf1) -> begin
(match (depnames1) with
| (depintf)::(dep1)::depnames' -> begin
(match (((depintf = intf1) && (dep1 = impl))) with
| true -> begin
((true), (depnames'))
end
| uu____717 -> begin
((false), (depnames1))
end)
end
| uu____719 -> begin
((false), (depnames1))
end)
end))
in (

let rec pop_tc_and_stack = (fun env1 stack ts2 -> (match (ts2) with
| [] -> begin
env1
end
| (uu____766)::ts3 -> begin
((pop env1 "");
(

let uu____788 = (

let uu____796 = (FStar_List.hd stack)
in (

let uu____801 = (FStar_List.tl stack)
in ((uu____796), (uu____801))))
in (match (uu____788) with
| ((env2, uu____815), stack1) -> begin
(pop_tc_and_stack env2 stack1 ts3)
end));
)
end))
in (match (ts1) with
| (ts_elt)::ts' -> begin
(

let uu____849 = ts_elt
in (match (uu____849) with
| (intf, impl, intf_t, impl_t) -> begin
(

let uu____867 = (match_dep depnames intf impl)
in (match (uu____867) with
| (b, depnames') -> begin
(

let uu____878 = ((not (b)) || (is_stale intf impl intf_t impl_t))
in (match (uu____878) with
| true -> begin
(

let env1 = (pop_tc_and_stack env' (FStar_List.rev_append st []) ts1)
in (tc_deps m good_stack env1 depnames good_ts))
end
| uu____889 -> begin
(

let uu____890 = (

let uu____898 = (FStar_List.hd st)
in (

let uu____903 = (FStar_List.tl st)
in ((uu____898), (uu____903))))
in (match (uu____890) with
| (stack_elt, st') -> begin
(iterate depnames' st' env' ts' ((stack_elt)::good_stack) ((ts_elt)::good_ts))
end))
end))
end))
end))
end
| [] -> begin
(tc_deps m good_stack env' depnames good_ts)
end))))
in (

let uu____943 = (deps_of_our_file filename)
in (match (uu____943) with
| (filenames, uu____952) -> begin
(iterate filenames (FStar_List.rev_append stk []) env (FStar_List.rev_append ts []) [] [])
end)))))


let json_to_str : FStar_Util.json  ->  Prims.string = (fun uu___223_983 -> (match (uu___223_983) with
| FStar_Util.JsonNull -> begin
"null"
end
| FStar_Util.JsonBool (b) -> begin
(FStar_Util.format1 "bool (%s)" (match (b) with
| true -> begin
"true"
end
| uu____985 -> begin
"false"
end))
end
| FStar_Util.JsonInt (i) -> begin
(

let uu____987 = (FStar_Util.string_of_int i)
in (FStar_Util.format1 "int (%s)" uu____987))
end
| FStar_Util.JsonStr (s) -> begin
(FStar_Util.format1 "string (%s)" s)
end
| FStar_Util.JsonList (uu____989) -> begin
"list (...)"
end
| FStar_Util.JsonAssoc (uu____991) -> begin
"dictionary (...)"
end))

exception UnexpectedJsonType of ((Prims.string * FStar_Util.json))


let uu___is_UnexpectedJsonType : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| UnexpectedJsonType (uu____1002) -> begin
true
end
| uu____1005 -> begin
false
end))


let __proj__UnexpectedJsonType__item__uu___ : Prims.exn  ->  (Prims.string * FStar_Util.json) = (fun projectee -> (match (projectee) with
| UnexpectedJsonType (uu____1016) -> begin
uu____1016
end))


let js_fail = (fun expected got -> (Prims.raise (UnexpectedJsonType (((expected), (got))))))


let js_int : FStar_Util.json  ->  Prims.int = (fun uu___224_1033 -> (match (uu___224_1033) with
| FStar_Util.JsonInt (i) -> begin
i
end
| other -> begin
(js_fail "int" other)
end))


let js_str : FStar_Util.json  ->  Prims.string = (fun uu___225_1038 -> (match (uu___225_1038) with
| FStar_Util.JsonStr (s) -> begin
s
end
| other -> begin
(js_fail "string" other)
end))


let js_list : FStar_Util.json  ->  FStar_Util.json Prims.list = (fun uu___226_1044 -> (match (uu___226_1044) with
| FStar_Util.JsonList (l) -> begin
l
end
| other -> begin
(js_fail "list" other)
end))


let js_assoc : FStar_Util.json  ->  (Prims.string * FStar_Util.json) Prims.list = (fun uu___227_1055 -> (match (uu___227_1055) with
| FStar_Util.JsonAssoc (a) -> begin
a
end
| other -> begin
(js_fail "dictionary" other)
end))

type push_kind =
| PushLax
| PushFull


let uu___is_PushLax : push_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PushLax -> begin
true
end
| uu____1070 -> begin
false
end))


let uu___is_PushFull : push_kind  ->  Prims.bool = (fun projectee -> (match (projectee) with
| PushFull -> begin
true
end
| uu____1074 -> begin
false
end))


let js_pushkind : FStar_Util.json  ->  push_kind = (fun s -> (

let uu____1078 = (js_str s)
in (match (uu____1078) with
| "lax" -> begin
PushLax
end
| "full" -> begin
PushFull
end
| uu____1079 -> begin
(js_fail "push_kind" s)
end)))

type query' =
| Exit
| DescribeProtocol
| Pop
| Push of (push_kind * Prims.string * Prims.int * Prims.int)
| AutoComplete of Prims.string
| Lookup of (Prims.string * (Prims.string * Prims.int * Prims.int) Prims.option * Prims.string Prims.list)
| ProtocolViolation of Prims.string 
 and query =
{qq : query'; qid : Prims.string}


let uu___is_Exit : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Exit -> begin
true
end
| uu____1113 -> begin
false
end))


let uu___is_DescribeProtocol : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| DescribeProtocol -> begin
true
end
| uu____1117 -> begin
false
end))


let uu___is_Pop : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Pop -> begin
true
end
| uu____1121 -> begin
false
end))


let uu___is_Push : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Push (_0) -> begin
true
end
| uu____1130 -> begin
false
end))


let __proj__Push__item___0 : query'  ->  (push_kind * Prims.string * Prims.int * Prims.int) = (fun projectee -> (match (projectee) with
| Push (_0) -> begin
_0
end))


let uu___is_AutoComplete : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| AutoComplete (_0) -> begin
true
end
| uu____1154 -> begin
false
end))


let __proj__AutoComplete__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| AutoComplete (_0) -> begin
_0
end))


let uu___is_Lookup : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Lookup (_0) -> begin
true
end
| uu____1174 -> begin
false
end))


let __proj__Lookup__item___0 : query'  ->  (Prims.string * (Prims.string * Prims.int * Prims.int) Prims.option * Prims.string Prims.list) = (fun projectee -> (match (projectee) with
| Lookup (_0) -> begin
_0
end))


let uu___is_ProtocolViolation : query'  ->  Prims.bool = (fun projectee -> (match (projectee) with
| ProtocolViolation (_0) -> begin
true
end
| uu____1210 -> begin
false
end))


let __proj__ProtocolViolation__item___0 : query'  ->  Prims.string = (fun projectee -> (match (projectee) with
| ProtocolViolation (_0) -> begin
_0
end))


let interactive_protocol_vernum : Prims.int = (Prims.parse_int "1")


let interactive_protocol_features : Prims.string Prims.list = ("autocomplete")::("describe-protocol")::("exit")::("lookup")::("lookup/documentation")::("pop")::("push")::[]

exception InvalidQuery of (Prims.string)


let uu___is_InvalidQuery : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| InvalidQuery (uu____1232) -> begin
true
end
| uu____1233 -> begin
false
end))


let __proj__InvalidQuery__item__uu___ : Prims.exn  ->  Prims.string = (fun projectee -> (match (projectee) with
| InvalidQuery (uu____1240) -> begin
uu____1240
end))

type query_status =
| QueryOK
| QueryNOK
| QueryViolatesProtocol


let uu___is_QueryOK : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryOK -> begin
true
end
| uu____1244 -> begin
false
end))


let uu___is_QueryNOK : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryNOK -> begin
true
end
| uu____1248 -> begin
false
end))


let uu___is_QueryViolatesProtocol : query_status  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QueryViolatesProtocol -> begin
true
end
| uu____1252 -> begin
false
end))


let try_assoc = (fun key a -> (

let uu____1274 = (FStar_Util.try_find (fun uu____1280 -> (match (uu____1280) with
| (k, uu____1284) -> begin
(k = key)
end)) a)
in (FStar_Util.map_option Prims.snd uu____1274)))


let unpack_interactive_query : FStar_Util.json  ->  query = (fun json -> (

let assoc1 = (fun errloc key a -> (

let uu____1306 = (try_assoc key a)
in (match (uu____1306) with
| Some (v1) -> begin
v1
end
| None -> begin
(

let uu____1309 = (

let uu____1310 = (FStar_Util.format2 "Missing key [%s] in %s." key errloc)
in InvalidQuery (uu____1310))
in (Prims.raise uu____1309))
end)))
in (

let request = (FStar_All.pipe_right json js_assoc)
in (

let qid = (

let uu____1319 = (assoc1 "query" "query-id" request)
in (FStar_All.pipe_right uu____1319 js_str))
in (

let query = (

let uu____1321 = (assoc1 "query" "query" request)
in (FStar_All.pipe_right uu____1321 js_str))
in (

let args = (

let uu____1326 = (assoc1 "query" "args" request)
in (FStar_All.pipe_right uu____1326 js_assoc))
in (

let arg = (fun k -> (assoc1 "[args]" k args))
in (

let try_arg = (fun k -> (try_assoc k args))
in (

let uu____1339 = (match (query) with
| "exit" -> begin
Exit
end
| "pop" -> begin
Pop
end
| "describe-protocol" -> begin
DescribeProtocol
end
| "push" -> begin
(

let uu____1340 = (

let uu____1345 = (

let uu____1346 = (arg "kind")
in (FStar_All.pipe_right uu____1346 js_pushkind))
in (

let uu____1347 = (

let uu____1348 = (arg "code")
in (FStar_All.pipe_right uu____1348 js_str))
in (

let uu____1349 = (

let uu____1350 = (arg "line")
in (FStar_All.pipe_right uu____1350 js_int))
in (

let uu____1351 = (

let uu____1352 = (arg "column")
in (FStar_All.pipe_right uu____1352 js_int))
in ((uu____1345), (uu____1347), (uu____1349), (uu____1351))))))
in Push (uu____1340))
end
| "autocomplete" -> begin
(

let uu____1353 = (

let uu____1354 = (arg "partial-symbol")
in (FStar_All.pipe_right uu____1354 js_str))
in AutoComplete (uu____1353))
end
| "lookup" -> begin
(

let uu____1355 = (

let uu____1364 = (

let uu____1365 = (arg "symbol")
in (FStar_All.pipe_right uu____1365 js_str))
in (

let uu____1366 = (

let uu____1371 = (

let uu____1376 = (try_arg "location")
in (FStar_All.pipe_right uu____1376 (FStar_Util.map_option js_assoc)))
in (FStar_All.pipe_right uu____1371 (FStar_Util.map_option (fun loc -> (

let uu____1404 = (

let uu____1405 = (assoc1 "[location]" "filename" loc)
in (FStar_All.pipe_right uu____1405 js_str))
in (

let uu____1406 = (

let uu____1407 = (assoc1 "[location]" "line" loc)
in (FStar_All.pipe_right uu____1407 js_int))
in (

let uu____1408 = (

let uu____1409 = (assoc1 "[location]" "column" loc)
in (FStar_All.pipe_right uu____1409 js_int))
in ((uu____1404), (uu____1406), (uu____1408)))))))))
in (

let uu____1410 = (

let uu____1412 = (

let uu____1414 = (arg "requested-info")
in (FStar_All.pipe_right uu____1414 js_list))
in (FStar_List.map js_str uu____1412))
in ((uu____1364), (uu____1366), (uu____1410)))))
in Lookup (uu____1355))
end
| uu____1421 -> begin
(

let uu____1422 = (FStar_Util.format1 "Unknown query \'%s\'" query)
in ProtocolViolation (uu____1422))
end)
in {qq = uu____1339; qid = qid})))))))))


let read_interactive_query : FStar_Util.stream_reader  ->  query = (fun stream -> try
(match (()) with
| () -> begin
(

let uu____1427 = (FStar_Util.read_line stream)
in (match (uu____1427) with
| None -> begin
(FStar_All.exit (Prims.parse_int "0"))
end
| Some (line) -> begin
(

let uu____1430 = (FStar_Util.json_of_string line)
in (match (uu____1430) with
| None -> begin
{qq = ProtocolViolation ("Json parsing failed."); qid = "?"}
end
| Some (request) -> begin
(unpack_interactive_query request)
end))
end))
end)
with
| InvalidQuery (msg) -> begin
{qq = ProtocolViolation (msg); qid = "?"}
end
| UnexpectedJsonType (expected, got) -> begin
(

let uu____1437 = (

let uu____1438 = (

let uu____1439 = (json_to_str got)
in (FStar_Util.format2 "JSON decoding failed: expected %s, got %s" expected uu____1439))
in ProtocolViolation (uu____1438))
in {qq = uu____1437; qid = "?"})
end)


let json_of_opt = (fun json_of_a opt_a -> (

let uu____1459 = (FStar_Util.map_option json_of_a opt_a)
in (FStar_Util.dflt FStar_Util.JsonNull uu____1459)))


let json_of_pos : FStar_Range.pos  ->  FStar_Util.json = (fun pos -> (

let uu____1464 = (

let uu____1466 = (

let uu____1467 = (FStar_Range.line_of_pos pos)
in FStar_Util.JsonInt (uu____1467))
in (

let uu____1468 = (

let uu____1470 = (

let uu____1471 = (FStar_Range.col_of_pos pos)
in FStar_Util.JsonInt (uu____1471))
in (uu____1470)::[])
in (uu____1466)::uu____1468))
in FStar_Util.JsonList (uu____1464)))


let json_of_range : FStar_Range.range  ->  FStar_Util.json = (fun r -> (

let uu____1475 = (

let uu____1479 = (

let uu____1482 = (

let uu____1483 = (FStar_Range.file_of_range r)
in FStar_Util.JsonStr (uu____1483))
in (("fname"), (uu____1482)))
in (

let uu____1484 = (

let uu____1488 = (

let uu____1491 = (

let uu____1492 = (FStar_Range.start_of_range r)
in (json_of_pos uu____1492))
in (("beg"), (uu____1491)))
in (

let uu____1493 = (

let uu____1497 = (

let uu____1500 = (

let uu____1501 = (FStar_Range.end_of_range r)
in (json_of_pos uu____1501))
in (("end"), (uu____1500)))
in (uu____1497)::[])
in (uu____1488)::uu____1493))
in (uu____1479)::uu____1484))
in FStar_Util.JsonAssoc (uu____1475)))


let json_of_issue_level : FStar_Errors.issue_level  ->  FStar_Util.json = (fun i -> FStar_Util.JsonStr ((match (i) with
| FStar_Errors.ENotImplemented -> begin
"not-implemented"
end
| FStar_Errors.EInfo -> begin
"info"
end
| FStar_Errors.EWarning -> begin
"warning"
end
| FStar_Errors.EError -> begin
"error"
end)))


let json_of_issue : FStar_Errors.issue  ->  FStar_Util.json = (fun issue -> (

let uu____1516 = (

let uu____1520 = (

let uu____1524 = (

let uu____1528 = (

let uu____1531 = (

let uu____1532 = (match (issue.FStar_Errors.issue_range) with
| None -> begin
[]
end
| Some (r) -> begin
(

let uu____1536 = (json_of_range r)
in (uu____1536)::[])
end)
in FStar_Util.JsonList (uu____1532))
in (("ranges"), (uu____1531)))
in (uu____1528)::[])
in ((("message"), (FStar_Util.JsonStr (issue.FStar_Errors.issue_message))))::uu____1524)
in ((("level"), ((json_of_issue_level issue.FStar_Errors.issue_level))))::uu____1520)
in FStar_Util.JsonAssoc (uu____1516)))

type lookup_result =
{lr_name : Prims.string; lr_def_range : FStar_Range.range Prims.option; lr_typ : Prims.string Prims.option; lr_doc : Prims.string Prims.option}


let json_of_lookup_result : lookup_result  ->  FStar_Util.json = (fun lr -> (

let uu____1585 = (

let uu____1589 = (

let uu____1593 = (

let uu____1596 = (json_of_opt json_of_range lr.lr_def_range)
in (("defined-at"), (uu____1596)))
in (

let uu____1597 = (

let uu____1601 = (

let uu____1604 = (json_of_opt (fun _0_32 -> FStar_Util.JsonStr (_0_32)) lr.lr_typ)
in (("type"), (uu____1604)))
in (

let uu____1605 = (

let uu____1609 = (

let uu____1612 = (json_of_opt (fun _0_33 -> FStar_Util.JsonStr (_0_33)) lr.lr_doc)
in (("documentation"), (uu____1612)))
in (uu____1609)::[])
in (uu____1601)::uu____1605))
in (uu____1593)::uu____1597))
in ((("name"), (FStar_Util.JsonStr (lr.lr_name))))::uu____1589)
in FStar_Util.JsonAssoc (uu____1585)))


let json_of_protocol_info : (Prims.string * FStar_Util.json) Prims.list = (

let js_version = FStar_Util.JsonInt (interactive_protocol_vernum)
in (

let js_features = (

let uu____1628 = (FStar_List.map (fun _0_34 -> FStar_Util.JsonStr (_0_34)) interactive_protocol_features)
in (FStar_All.pipe_left (fun _0_35 -> FStar_Util.JsonList (_0_35)) uu____1628))
in ((("version"), (js_version)))::((("features"), (js_features)))::[]))


let write_json : FStar_Util.json  ->  Prims.unit = (fun json -> ((

let uu____1641 = (FStar_Util.string_of_json json)
in (FStar_Util.print_raw uu____1641));
(FStar_Util.print_raw "\n");
))


let write_response : Prims.string  ->  query_status  ->  FStar_Util.json  ->  Prims.unit = (fun qid status response -> (

let qid1 = FStar_Util.JsonStr (qid)
in (

let status1 = (match (status) with
| QueryOK -> begin
FStar_Util.JsonStr ("success")
end
| QueryNOK -> begin
FStar_Util.JsonStr ("failure")
end
| QueryViolatesProtocol -> begin
FStar_Util.JsonStr ("protocol-violation")
end)
in (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("response"))))::((("query-id"), (qid1)))::((("status"), (status1)))::((("response"), (response)))::[]))))))


let write_message : Prims.string  ->  Prims.string  ->  Prims.unit = (fun level contents -> (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("message"))))::((("level"), (FStar_Util.JsonStr (level))))::((("contents"), (FStar_Util.JsonStr (contents))))::[]))))


let write_hello : Prims.unit  ->  Prims.unit = (fun uu____1679 -> (

let js_version = FStar_Util.JsonInt (interactive_protocol_vernum)
in (

let js_features = (

let uu____1682 = (FStar_List.map (fun _0_36 -> FStar_Util.JsonStr (_0_36)) interactive_protocol_features)
in FStar_Util.JsonList (uu____1682))
in (write_json (FStar_Util.JsonAssoc (((("kind"), (FStar_Util.JsonStr ("protocol-info"))))::json_of_protocol_info))))))

type repl_state =
{repl_line : Prims.int; repl_column : Prims.int; repl_fname : Prims.string; repl_stack : stack_t; repl_curmod : modul_t; repl_env : env_t; repl_ts : m_timestamps; repl_stdin : FStar_Util.stream_reader}


let run_exit = (fun st -> ((((QueryOK), (FStar_Util.JsonNull))), (FStar_Util.Inr ((Prims.parse_int "0")))))


let run_describe_protocol = (fun st -> ((((QueryOK), (FStar_Util.JsonAssoc (json_of_protocol_info)))), (FStar_Util.Inl (st))))


let run_protocol_violation = (fun st message -> ((((QueryViolatesProtocol), (FStar_Util.JsonStr (message)))), (FStar_Util.Inl (st))))


let run_pop = (fun st -> (match (st.repl_stack) with
| [] -> begin
((((QueryNOK), (FStar_Util.JsonStr ("Too many pops")))), (FStar_Util.Inl (st)))
end
| ((env, curmod))::stack -> begin
((pop st.repl_env "#pop");
(match (((FStar_List.length stack) = (FStar_List.length st.repl_ts))) with
| true -> begin
(cleanup env)
end
| uu____1845 -> begin
()
end);
((((QueryOK), (FStar_Util.JsonNull))), (FStar_Util.Inl ((

let uu___234_1850 = st
in {repl_line = uu___234_1850.repl_line; repl_column = uu___234_1850.repl_column; repl_fname = uu___234_1850.repl_fname; repl_stack = stack; repl_curmod = curmod; repl_env = env; repl_ts = uu___234_1850.repl_ts; repl_stdin = uu___234_1850.repl_stdin}))));
)
end))


let run_push = (fun st kind text1 line column1 -> (

let uu____1884 = ((st.repl_stack), (st.repl_env), (st.repl_ts))
in (match (uu____1884) with
| (stack, env, ts) -> begin
(

let uu____1897 = (match (((FStar_List.length stack) = (FStar_List.length ts))) with
| true -> begin
(

let uu____1920 = (update_deps st.repl_fname st.repl_curmod stack env ts)
in ((true), (uu____1920)))
end
| uu____1927 -> begin
((false), (((stack), (env), (ts))))
end)
in (match (uu____1897) with
| (restore_cmd_line_options1, (stack1, env1, ts1)) -> begin
(

let stack2 = (((env1), (st.repl_curmod)))::stack1
in (

let env2 = (push env1 (kind = PushLax) restore_cmd_line_options1 "#push")
in (

let env_mark = (mark env2)
in (

let frag = {FStar_Parser_ParseIt.frag_text = text1; FStar_Parser_ParseIt.frag_line = line; FStar_Parser_ParseIt.frag_col = column1}
in (

let res = (check_frag env_mark st.repl_curmod ((frag), (false)))
in (

let errors = (

let uu____1967 = (FStar_Errors.report_all ())
in (FStar_All.pipe_right uu____1967 (FStar_List.map json_of_issue)))
in ((FStar_Errors.clear ());
(

let st' = (

let uu___235_1973 = st
in {repl_line = line; repl_column = column1; repl_fname = uu___235_1973.repl_fname; repl_stack = stack2; repl_curmod = uu___235_1973.repl_curmod; repl_env = uu___235_1973.repl_env; repl_ts = ts1; repl_stdin = uu___235_1973.repl_stdin})
in (match (res) with
| Some (curmod, env3, nerrs) when (nerrs = (Prims.parse_int "0")) -> begin
(

let env4 = (commit_mark env3)
in ((((QueryOK), (FStar_Util.JsonList (errors)))), (FStar_Util.Inl ((

let uu___236_2002 = st'
in {repl_line = uu___236_2002.repl_line; repl_column = uu___236_2002.repl_column; repl_fname = uu___236_2002.repl_fname; repl_stack = uu___236_2002.repl_stack; repl_curmod = curmod; repl_env = env4; repl_ts = uu___236_2002.repl_ts; repl_stdin = uu___236_2002.repl_stdin})))))
end
| uu____2003 -> begin
(

let env3 = (reset_mark env_mark)
in (

let uu____2014 = (run_pop (

let uu___237_2021 = st'
in {repl_line = uu___237_2021.repl_line; repl_column = uu___237_2021.repl_column; repl_fname = uu___237_2021.repl_fname; repl_stack = uu___237_2021.repl_stack; repl_curmod = uu___237_2021.repl_curmod; repl_env = env3; repl_ts = uu___237_2021.repl_ts; repl_stdin = uu___237_2021.repl_stdin}))
in (match (uu____2014) with
| (uu____2028, st'') -> begin
((((QueryNOK), (FStar_Util.JsonList (errors)))), (st''))
end)))
end));
)))))))
end))
end)))


let run_lookup = (fun st symbol pos_opt requested_info -> (

let uu____2080 = st.repl_env
in (match (uu____2080) with
| (dsenv, tcenv) -> begin
(

let info_of_lid_str = (fun lid_str -> (

let lid = (

let uu____2100 = (FStar_List.map FStar_Ident.id_of_text (FStar_Util.split lid_str "."))
in (FStar_Ident.lid_of_ids uu____2100))
in (

let lid1 = (

let uu____2103 = (FStar_ToSyntax_Env.resolve_to_fully_qualified_name dsenv lid)
in (FStar_All.pipe_left (FStar_Util.dflt lid) uu____2103))
in (

let uu____2106 = (FStar_TypeChecker_Env.try_lookup_lid tcenv lid1)
in (FStar_All.pipe_right uu____2106 (FStar_Util.map_option (fun uu____2132 -> (match (uu____2132) with
| ((uu____2142, typ), r) -> begin
((FStar_Util.Inr (lid1)), (typ), (r))
end))))))))
in (

let docs_of_lid = (fun lid -> (

let uu____2154 = (FStar_ToSyntax_Env.try_lookup_doc dsenv lid)
in (FStar_All.pipe_right uu____2154 (FStar_Util.map_option Prims.fst))))
in (

let info_at_pos_opt = (FStar_Util.bind_opt pos_opt (fun uu____2181 -> (match (uu____2181) with
| (file, row, col) -> begin
(FStar_TypeChecker_Err.info_at_pos tcenv file row col)
end)))
in (

let info_opt = (match (info_at_pos_opt) with
| Some (uu____2207) -> begin
info_at_pos_opt
end
| None -> begin
(match ((symbol = "")) with
| true -> begin
None
end
| uu____2234 -> begin
(info_of_lid_str symbol)
end)
end)
in (

let response = (match (info_opt) with
| None -> begin
((QueryNOK), (FStar_Util.JsonNull))
end
| Some (name_or_lid, typ, rng) -> begin
(

let name = (match (name_or_lid) with
| FStar_Util.Inl (name) -> begin
name
end
| FStar_Util.Inr (lid) -> begin
(FStar_Ident.string_of_lid lid)
end)
in (

let typ_str = (match ((FStar_List.mem "type" requested_info)) with
| true -> begin
(

let uu____2263 = (FStar_TypeChecker_Normalize.term_to_string tcenv typ)
in Some (uu____2263))
end
| uu____2264 -> begin
None
end)
in (

let doc_str = (match (name_or_lid) with
| FStar_Util.Inr (lid) when (FStar_List.mem "documentation" requested_info) -> begin
(docs_of_lid lid)
end
| uu____2269 -> begin
None
end)
in (

let def_range = (match ((FStar_List.mem "defined-at" requested_info)) with
| true -> begin
Some (rng)
end
| uu____2275 -> begin
None
end)
in (

let result = {lr_name = name; lr_def_range = def_range; lr_typ = typ_str; lr_doc = doc_str}
in (

let uu____2277 = (json_of_lookup_result result)
in ((QueryOK), (uu____2277))))))))
end)
in ((response), (FStar_Util.Inl (st))))))))
end)))


let run_completions = (fun st search_term -> (

let uu____2300 = st.repl_env
in (match (uu____2300) with
| (dsenv, tcenv) -> begin
(

let rec measure_anchored_match = (fun search_term1 candidate -> (match (((search_term1), (candidate))) with
| ([], uu____2330) -> begin
Some ((([]), ((Prims.parse_int "0"))))
end
| (uu____2338, []) -> begin
None
end
| ((hs)::ts, (hc)::tc) -> begin
(

let hc_text = (FStar_Ident.text_of_id hc)
in (match ((FStar_Util.starts_with hc_text hs)) with
| true -> begin
(match (ts) with
| [] -> begin
Some (((candidate), ((FStar_String.length hs))))
end
| uu____2368 -> begin
(

let uu____2370 = (measure_anchored_match ts tc)
in (FStar_All.pipe_right uu____2370 (FStar_Util.map_option (fun uu____2389 -> (match (uu____2389) with
| (matched, len) -> begin
(((hc)::matched), ((((FStar_String.length hc_text) + (Prims.parse_int "1")) + len)))
end)))))
end)
end
| uu____2404 -> begin
None
end))
end))
in (

let rec locate_match = (fun needle candidate -> (

let uu____2425 = (measure_anchored_match needle candidate)
in (match (uu____2425) with
| Some (matched, n1) -> begin
Some ((([]), (matched), (n1)))
end
| None -> begin
(match (candidate) with
| [] -> begin
None
end
| (hc)::tc -> begin
(

let uu____2467 = (locate_match needle tc)
in (FStar_All.pipe_right uu____2467 (FStar_Util.map_option (fun uu____2496 -> (match (uu____2496) with
| (prefix1, matched, len) -> begin
(((hc)::prefix1), (matched), (len))
end)))))
end)
end)))
in (

let str_of_ids = (fun ids -> (

let uu____2522 = (FStar_List.map FStar_Ident.text_of_id ids)
in (FStar_Util.concat_l "." uu____2522)))
in (

let match_lident_against = (fun needle lident -> (locate_match needle (FStar_List.append lident.FStar_Ident.ns ((lident.FStar_Ident.ident)::[]))))
in (

let shorten_namespace = (fun uu____2551 -> (match (uu____2551) with
| (prefix1, matched, match_len) -> begin
(

let naked_match = (match (matched) with
| (uu____2569)::[] -> begin
true
end
| uu____2570 -> begin
false
end)
in (

let uu____2572 = (FStar_ToSyntax_Env.shorten_module_path dsenv prefix1 naked_match)
in (match (uu____2572) with
| (stripped_ns, shortened) -> begin
(

let uu____2587 = (str_of_ids shortened)
in (

let uu____2588 = (str_of_ids matched)
in (

let uu____2589 = (str_of_ids stripped_ns)
in ((uu____2587), (uu____2588), (uu____2589), (match_len)))))
end)))
end))
in (

let prepare_candidate = (fun uu____2600 -> (match (uu____2600) with
| (prefix1, matched, stripped_ns, match_len) -> begin
(match ((prefix1 = "")) with
| true -> begin
((matched), (stripped_ns), (match_len))
end
| uu____2615 -> begin
(((Prims.strcat prefix1 (Prims.strcat "." matched))), (stripped_ns), ((((FStar_String.length prefix1) + match_len) + (Prims.parse_int "1"))))
end)
end))
in (

let needle = (FStar_Util.split search_term ".")
in (

let all_lidents_in_env = (FStar_TypeChecker_Env.lidents tcenv)
in (

let matches = (

let case_a_find_transitive_includes = (fun orig_ns m id -> (

let exported_names = (FStar_ToSyntax_Env.transitive_exported_ids dsenv m)
in (

let matched_length = (FStar_List.fold_left (fun out s -> (((FStar_String.length s) + out) + (Prims.parse_int "1"))) (FStar_String.length id) orig_ns)
in (FStar_All.pipe_right exported_names (FStar_List.filter_map (fun n1 -> (match ((FStar_Util.starts_with n1 id)) with
| true -> begin
(

let lid = (FStar_Ident.lid_of_ns_and_id (FStar_Ident.ids_of_lid m) (FStar_Ident.id_of_text n1))
in (

let uu____2682 = (FStar_ToSyntax_Env.resolve_to_fully_qualified_name dsenv lid)
in (FStar_Option.map (fun fqn -> (

let uu____2690 = (

let uu____2692 = (FStar_List.map FStar_Ident.id_of_text orig_ns)
in (FStar_List.append uu____2692 ((fqn.FStar_Ident.ident)::[])))
in (([]), (uu____2690), (matched_length)))) uu____2682)))
end
| uu____2696 -> begin
None
end)))))))
in (

let case_b_find_matches_in_env = (fun uu____2711 -> (

let matches = (FStar_List.filter_map (match_lident_against needle) all_lidents_in_env)
in (FStar_All.pipe_right matches (FStar_List.filter (fun uu____2747 -> (match (uu____2747) with
| (ns, id, uu____2755) -> begin
(

let uu____2760 = (

let uu____2762 = (FStar_Ident.lid_of_ids id)
in (FStar_ToSyntax_Env.resolve_to_fully_qualified_name dsenv uu____2762))
in (match (uu____2760) with
| None -> begin
false
end
| Some (l) -> begin
(

let uu____2764 = (FStar_Ident.lid_of_ids (FStar_List.append ns id))
in (FStar_Ident.lid_equals l uu____2764))
end))
end))))))
in (

let uu____2765 = (FStar_Util.prefix needle)
in (match (uu____2765) with
| (ns, id) -> begin
(

let matched_ids = (match (ns) with
| [] -> begin
(case_b_find_matches_in_env ())
end
| uu____2790 -> begin
(

let l = (FStar_Ident.lid_of_path ns FStar_Range.dummyRange)
in (

let uu____2793 = (FStar_ToSyntax_Env.resolve_module_name dsenv l true)
in (match (uu____2793) with
| None -> begin
(case_b_find_matches_in_env ())
end
| Some (m) -> begin
(case_a_find_transitive_includes ns m id)
end)))
end)
in (FStar_All.pipe_right matched_ids (FStar_List.map (fun x -> (

let uu____2826 = (shorten_namespace x)
in (prepare_candidate uu____2826))))))
end))))
in (

let json_candidates = (

let uu____2833 = (FStar_Util.sort_with (fun uu____2841 uu____2842 -> (match (((uu____2841), (uu____2842))) with
| ((cd1, ns1, uu____2857), (cd2, ns2, uu____2860)) -> begin
(match ((FStar_String.compare cd1 cd2)) with
| _0_37 when (_0_37 = (Prims.parse_int "0")) -> begin
(FStar_String.compare ns1 ns2)
end
| n1 -> begin
n1
end)
end)) matches)
in (FStar_List.map (fun uu____2871 -> (match (uu____2871) with
| (candidate, ns, match_len) -> begin
FStar_Util.JsonList ((FStar_Util.JsonInt (match_len))::(FStar_Util.JsonStr (ns))::(FStar_Util.JsonStr (candidate))::[])
end)) uu____2833))
in ((((QueryOK), (FStar_Util.JsonList (json_candidates)))), (FStar_Util.Inl (st)))))))))))))
end)))


let run_query : repl_state  ->  query'  ->  ((query_status * FStar_Util.json) * (repl_state, Prims.int) FStar_Util.either) = (fun st uu___228_2901 -> (match (uu___228_2901) with
| Exit -> begin
(run_exit st)
end
| DescribeProtocol -> begin
(run_describe_protocol st)
end
| Pop -> begin
(run_pop st)
end
| Push (kind, text1, l, c) -> begin
(run_push st kind text1 l c)
end
| AutoComplete (search_term) -> begin
(run_completions st search_term)
end
| Lookup (symbol, pos_opt, rqi) -> begin
(run_lookup st symbol pos_opt rqi)
end
| ProtocolViolation (query) -> begin
(run_protocol_violation st query)
end))


let rec go : repl_state  ->  Prims.unit = (fun st -> (

let query = (read_interactive_query st.repl_stdin)
in (

let uu____2931 = (

let uu____2938 = (run_query st)
in (uu____2938 query.qq))
in (match (uu____2931) with
| ((status, response), state_opt) -> begin
((write_response query.qid status response);
(match (state_opt) with
| FStar_Util.Inl (st') -> begin
(go st')
end
| FStar_Util.Inr (exitcode) -> begin
(FStar_All.exit exitcode)
end);
)
end))))


let interactive_error_handler : FStar_Errors.error_handler = (

let issues = (FStar_Util.mk_ref [])
in (

let add_one1 = (fun e -> (

let uu____2968 = (

let uu____2970 = (FStar_ST.read issues)
in (e)::uu____2970)
in (FStar_ST.write issues uu____2968)))
in (

let count_errors = (fun uu____2981 -> (

let uu____2982 = (

let uu____2984 = (FStar_ST.read issues)
in (FStar_List.filter (fun e -> (e.FStar_Errors.issue_level = FStar_Errors.EError)) uu____2984))
in (FStar_List.length uu____2982)))
in (

let report1 = (fun uu____2995 -> (

let uu____2996 = (FStar_ST.read issues)
in (FStar_List.sortWith FStar_Errors.compare_issues uu____2996)))
in (

let clear1 = (fun uu____3004 -> (FStar_ST.write issues []))
in {FStar_Errors.eh_add_one = add_one1; FStar_Errors.eh_count_errors = count_errors; FStar_Errors.eh_report = report1; FStar_Errors.eh_clear = clear1})))))


let interactive_printer : FStar_Util.printer = {FStar_Util.printer_prinfo = (write_message "info"); FStar_Util.printer_prwarning = (write_message "warning"); FStar_Util.printer_prerror = (write_message "error")}


let interactive_mode' : Prims.string  ->  Prims.unit = (fun filename -> ((write_hello ());
(

let uu____3014 = (deps_of_our_file filename)
in (match (uu____3014) with
| (filenames, maybe_intf) -> begin
(

let env = (tc_prims ())
in (

let uu____3028 = (tc_deps None [] env filenames [])
in (match (uu____3028) with
| (stack, env1, ts) -> begin
(

let initial_range = (

let uu____3044 = (FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0"))
in (

let uu____3045 = (FStar_Range.mk_pos (Prims.parse_int "1") (Prims.parse_int "0"))
in (FStar_Range.mk_range "<input>" uu____3044 uu____3045)))
in (

let env2 = (

let uu____3049 = (FStar_TypeChecker_Env.set_range (Prims.snd env1) initial_range)
in (((Prims.fst env1)), (uu____3049)))
in (

let env3 = (match (maybe_intf) with
| Some (intf) -> begin
(FStar_Universal.load_interface_decls env2 intf)
end
| None -> begin
env2
end)
in (

let init_st = (

let uu____3057 = (FStar_Util.open_stdin ())
in {repl_line = (Prims.parse_int "1"); repl_column = (Prims.parse_int "0"); repl_fname = filename; repl_stack = stack; repl_curmod = None; repl_env = env3; repl_ts = ts; repl_stdin = uu____3057})
in (

let uu____3058 = ((FStar_Options.record_hints ()) || (FStar_Options.use_hints ()))
in (match (uu____3058) with
| true -> begin
(

let uu____3059 = (

let uu____3060 = (FStar_Options.file_list ())
in (FStar_List.hd uu____3060))
in (FStar_SMTEncoding_Solver.with_hints_db uu____3059 (fun uu____3062 -> (go init_st))))
end
| uu____3063 -> begin
(go init_st)
end))))))
end)))
end));
))


let interactive_mode : Prims.string  ->  Prims.unit = (fun filename -> ((FStar_Util.set_printer interactive_printer);
(FStar_Errors.set_handler interactive_error_handler);
(

let uu____3070 = (

let uu____3071 = (FStar_Options.codegen ())
in (FStar_Option.isSome uu____3071))
in (match (uu____3070) with
| true -> begin
(FStar_Util.print_warning "code-generation is not supported in interactive mode, ignoring the codegen flag")
end
| uu____3073 -> begin
()
end));
try
(match (()) with
| () -> begin
(interactive_mode' filename)
end)
with
| e -> begin
((FStar_Errors.set_handler FStar_Errors.default_handler);
(Prims.raise e);
)
end;
))




