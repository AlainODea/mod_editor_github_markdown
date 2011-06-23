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
