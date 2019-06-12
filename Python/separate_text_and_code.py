# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   File Name：     separate_text_and_code
   Description :
   Author :       xubowen
   date：          2018/10/31 10:55 AM
-------------------------------------------------
   Change Activity:
                   2018/10/31 10:55 AM
-------------------------------------------------
"""


def separate_text_code(html_str):
    '''
    Separate text and code (surrounded by <pre><code> and </pre></code>)
    :param html_str:
    :return: text and code in String
    '''
    import re
    # regex: <pre(.*)><code>([\s\S]*?)</code></pre>
    regex_pattern = r'<pre(.*?)><code>([\s\S]*?)</code></pre>'
    code_list = []
    html_text = html_str
    for m in re.finditer(regex_pattern, html_str):
        # print("start %d end %d" % (m.start(), m.end()))
        raw_code = html_str[m.start():m.end()]
        clean_code = clean_html_tags(raw_code).replace('\n', ' ')
        code_list.append(clean_code)
        # remove code
        html_text = html_text.replace(raw_code, " ")
    clean_html_text = clean_html_tags(html_text)
    clean_html_text = remove_symbols(clean_html_text)
    if len(code_list) == 0:
        code_str = ''
    else:
        code_str = ' '.join(code_list)
    return clean_html_text, code_str


def clean_html_tags(raw_html):
    from bs4 import BeautifulSoup
    try:
        text = BeautifulSoup(raw_html, "html.parser").text
    except Exception as e:
        # UnboundLocalError
        text = clean_html_tags2(raw_html)
    finally:
        return text


def clean_html_tags2(raw_html):
    import re
    cleanr = re.compile('<.*?>')
    cleantext = re.sub(cleanr, '', raw_html)
    return cleantext


def remove_symbols(strtmp):
    return strtmp.replace('\n', ' ')


if __name__ == '__main__':
    text_str = str(
        """"Check for changes to an SQL Server table?","<p>How can I monitor an SQL Server database for changes to a table without using triggers or modifying the structure of the database in any way? My preferred programming environment is <a href=\"http://en.wikipedia.org/wiki/.NET_Framework\" rel=\"nofollow noreferrer\">.NET</a> and C#.</p>&#xA;&#xA;<p>I'd like to be able to support any <a href=\"http://en.wikipedia.org/wiki/Microsoft_SQL_Server#Genesis\" rel=\"nofollow noreferrer\">SQL Server 2000</a> SP4 or newer. My application is a bolt-on data visualization for another company's product. Our customer base is in the thousands, so I don't want to have to put in requirements that we modify the third-party vendor's table at every installation.</p>&#xA;&#xA;<p>By <em>\"changes to a table\"</em> I mean changes to table data, not changes to table structure.</p>&#xA;&#xA;<p>Ultimately, I would like the change to trigger an event in my application, instead of having to check for changes at an interval.</p>&#xA;&#xA;<hr>&#xA;&#xA;<p>The best course of action given my requirements (no triggers or schema modification, SQL Server 2000 and 2005) seems to be to use the <code>BINARY_CHECKSUM</code> function in <a href=\"http://en.wikipedia.org/wiki/Transact-SQL\" rel=\"nofollow noreferrer\">T-SQL</a>. The way I plan to implement is this:</p>&#xA;&#xA;<p>Every X seconds run the following query:</p>&#xA;&#xA;<pre><code>SELECT CHECKSUM_AGG(BINARY_CHECKSUM(*))&#xA;FROM sample_table&#xA;WITH (NOLOCK);&#xA;</code></pre>&#xA;&#xA;<p>And compare that against the stored value. If the value has changed, go through the table row by row using the query:</p>&#xA;&#xA;<pre><code>SELECT row_id, BINARY_CHECKSUM(*)&#xA;FROM sample_table&#xA;WITH (NOLOCK);&#xA;</code></pre>&#xA;&#xA;<p>And compare the returned checksums against stored values.</p>&#xA;""")
    text, code = separate_text_code(text_str)
    text = clean_html_tags(text)
    print("text:\n%s\n" % text)
    print("code:\n%s\n" % code)
    # for c in code:
    #     print("c:\n%s" % c)
