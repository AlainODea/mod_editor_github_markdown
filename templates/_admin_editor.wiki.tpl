<!--
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
-->
{% extends "admin_edit_widget_i18n.tpl" %}

{% block widget_title %}{_ Content _}{% endblock %}
{% block widget_show_minimized %}false{% endblock %}


{% block widget_content %}
{% with m.rsc[id] as r %}
<fieldset class="admin-form">
	{% button action={zmedia id=id media_div_id=#media subject_id=id} text=_"Add media to body" id="zmedia-open-dialog" style="display:none" %}
	{% wire action={event type='named' name="zmedia" action={zmedia id=id media_div_id=#media subject_id=id}} %}
	{% wire action={event type='named' name="zlink" action={dialog_open title="Add link" template="_action_dialog_zlink.tpl"}} %}

	<div class="form-item clearfix">
	    {% with is_i18n|if:r.translation[lang_code].body:r.body  as  body %}
		{% if is_editable %}
		    <textarea rows="10" cols="10" id="rsc-body{{ lang_code_with_dollar }}" name="body{{ lang_code_with_dollar }}" class="body">{{ body|escape }}</textarea>
		{% else %}
		    {{ body }}
		{% endif %}
	    {% endwith %}
	</div>
</fieldset>

{% include "_admin_save_buttons.tpl" %}
{% endwith %}
{% endblock %}

{% block widget_after %}
{% endblock %}
