(*
   Copyright 2008-2018 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
module Bug1392

open FStar.Tactics

let unsquash #a : a -> squash a =
  fun _ -> ()

let broken (a: Type0) =
  assert_by_tactic a (fun () ->
                        apply (`unsquash); //(unsquash #a));
                        let g = cur_goal () in
                        let aa = unquote #Type0 g in
                        let xx : aa = admit #aa () in
                        exact (quote xx))
