{% extends 'full.tpl'%}

{%- block header -%}
{{ super() }}

<script src="https://unpkg.com/jquery"></script>

<style type="text/css">
div.output_wrapper {
  margin-top: 0px;
}
.output_text {
  max-height: 200px;
  overflow-y: scroll;
}

/*
.text_cell inner_cell {
  background-color: #fffff6;
}
*/

</style>

{%- endblock header -%}

{% block in_prompt -%}
<div class="prompt input_prompt">
  <strong>>>></strong>&nbsp;
</div>
{%- endblock in_prompt -%}
