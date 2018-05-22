{% extends 'workshop_notes_markdown.tpl'%}

{% block any_cell %}
{% if 'challenge' in cell['metadata'].get('tags', []) %}
{{ super() }}
{% elif 'solution' in cell['metadata'].get('tags', []) %}
<!-- {{ super() }} -->
{% elif 'instructor' in cell['metadata'].get('tags', []) %}
<!-- {{ super() }} -->
{% elif 'hide' in cell['metadata'].get('tags', []) %}
<!-- {{ super() }} -->
{% elif 'oneday' in cell['metadata'].get('tags', []) %}
<!-- {{ super() }} -->
{% else %}
{{ super() }}
{% endif %}
{% endblock any_cell %}
