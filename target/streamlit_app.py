import json
import streamlit as st
import streamlit.components.v1 as components

st.set_page_config(
    page_title="dbt App",
    page_icon="🧊",
    layout="wide",
    initial_sidebar_state="expanded",
    menu_items={
        'Get Help': 'https://dev.classmethod.jp/',
        'Report a bug': "https://classmethod.jp/",
        'About': "Classmethod,Inc"
    }
)

st.markdown(
    r"""
    <style>
    .stDeployButton {
            visibility: hidden;
        }
    </style>
    """, unsafe_allow_html=True
)

# manifest.jsonとcatalog.jsonを読み込む
with open('manifest.json', 'r', encoding='utf-8') as f:
    manifest = json.load(f)

with open('catalog.json', 'r', encoding='utf-8') as f:
    catalog = json.load(f)

# index.htmlを読み込む
with open('index.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# manifest/catalogをHTMLに埋め込む
inject_script = f'''
<script>
    window.manifest = {json.dumps(manifest)};
    window.catalog = {json.dumps(catalog)};
</script>
'''
html_content = html_content.replace('</head>', inject_script + '</head>')

components.html(html_content, height=1024, scrolling=False)

