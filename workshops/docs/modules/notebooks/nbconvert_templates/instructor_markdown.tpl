{% extends 'workshop_notes_markdown.tpl'%}

{% block any_cell %}
{% if 'challenge' in cell['metadata'].get('tags', []) %}
        {{ super() }}
{% elif 'solution' in cell['metadata'].get('tags', []) %}
        {{ super() }}
{% elif 'instructor' in cell['metadata'].get('tags', []) %}
        {{ super() }}
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
