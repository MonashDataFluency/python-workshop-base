{% extends 'markdown.tpl'%}

{%- block header -%}
{{ super() }}

<style>
.output_label {
    text-align: right;
    margin: -1em;
    padding: 0;
    font-size: 0.5em;
    color: grey
}
</style>
{%- endblock header -%}

{% block stream %}
<pre class="output">
<div class="output_label">output</div>
<code class="text">
{{ output.text }}
</code>
</pre>
{% endblock stream %}

{% block data_text scoped %}
<pre class="output">
<div style="text-align: right; margin: -1em; padding: 0;"><span style="font-size: 0.5em; color: grey">output</span></div>
<code class="text">
{{ output.get('data', {}).get('text/plain', '') }}
</code>
</pre>
{% endblock data_text %}
