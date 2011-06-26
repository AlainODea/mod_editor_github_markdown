%% @author Alain O'Dea <alain.odea@gmail.com>
%% @copyright 2010 Alain O'Dea
%% @date 2011-06-19
%% @doc Github Flavored Markdown Editor for Zotonic

%% Copyright 2010,2011 Alain O'Dea
%%
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

-module(mod_editor_github_markdown).
-mod_title("Markdown Editor").
-mod_description("Page editor supporting Github Flavored Markdown").

-export([path/1]).

path(Context) ->
    proplists:get_value(?MODULE, z_module_manager:active_dir(Context)).
