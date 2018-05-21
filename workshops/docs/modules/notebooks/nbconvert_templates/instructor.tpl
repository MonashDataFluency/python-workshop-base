{% extends 'workshop_notes.tpl'%}

{% block any_cell %}
{% if 'challenge' in cell['metadata'].get('tags', []) %}
    <div style="background: #ffefef; border: solid thin #ffbaba">
        {{ super() }}
    </div>
{% elif 'solution' in cell['metadata'].get('tags', []) %}
    <div style="background: #efffef; border: solid thin #c6d8c6">
        {{ super() }}
    </div>
{% elif 'instructor' in cell['metadata'].get('tags', []) %}
    <div style="background: #f0f0ff; border: solid thin #bbbbff">
        {{ super() }}
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
