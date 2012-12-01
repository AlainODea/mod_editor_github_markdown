%% @author Alain O'Dea <alain.odea@gmail.com>
%% @doc 'redcarpet' filter, format content using Github's Redcarpet

%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%% 
%%     http://www.apache.org/licenses/LICENSE-2.0
%% 
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_redcarpet).
-export([redcarpet/2]).

-define(Z_MODULE, mod_editor_github_markdown).

redcarpet(Content, Context) ->
    process_flag(trap_exit, true),
    Redcarpet = open_port({spawn, script(Context)}, [binary, stream]),
    true = port_command(Redcarpet, Content),
    formatted(Redcarpet, data(Redcarpet), []).

script(Context) ->
    mod_editor_github_markdown:path(Context) ++ "/support/redcarpet".

formatted(_Redcarpet, done, Data) ->
    Data;
formatted(Redcarpet, Data, Acc) ->
    formatted(Redcarpet, data(Redcarpet), [Data|Acc]).

data(Redcarpet) ->
    receive
	{Redcarpet, {data, Data}} ->
	    Data;
	{'EXIT', Redcarpet, normal} ->
	    done
    end.
