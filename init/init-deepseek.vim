
function! DeepSeek(prompt)
    let api_key = "sk-7f3aff060a0743f8bbe5eef3890c526d"  " 替换成你的 API Key
    let model = "deepseek-coder"           " 或 deepseek-chat
    let url = "https://api.deepseek.com/v1/chat/completions"

    " 构造 JSON 请求
    let data = '{"model": "' . model . '", "messages": [{"role": "user", "content": ' . a:prompt . '}]}'

    " 发送请求并解析响应
    let response = system('curl -s -X POST ' . url . ' -H "Content-Type: application/json"' . ' -H "Authorization: Bearer ' . api_key . '"' . " -d '" . data . "'")

    echo 'curl -s -X POST ' . url . ' -H "Content-Type: application/json"' . ' -H "Authorization: Bearer ' . api_key . '"' . " -d '" . data . "'"

    " 解析 JSON 并返回内容（需要 jq 工具）
    let json_response = system("echo '" . response . "'" . ' | jq -r ".choices[0].message.content"')
    return json_response
endfunction

" 定义命令 :DeepSeek "你的问题"
command! -nargs=1 DS call setline('.', DeepSeek(<q-args>))

