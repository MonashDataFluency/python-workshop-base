{% extends 'workshop_notes.tpl'%}

{% block any_cell %}
{% if 'challenge' in cell['metadata'].get('tags', []) %}
    <div style="background: #ffefef; border: solid thin #ffbaba">
        {{ super() }}
    </div>
{% elif 'solution' in cell['metadata'].get('tags', []) %}
    <div style="display:none">
    </div>
{% elif 'instructor' in cell['metadata'].get('tags', []) %}
    <div style="display:none">
    </div>
{% elif 'hide' in cell['metadata'].get('tags', []) %}
    <div style="display:none">
    </div>
{% elif 'oneday' in cell['metadata'].get('tags', []) %}
    <div style="display:none">
    </div>
{% else %}
    {{ super() }}
{% endif %}
{% endblock any_cell %}
