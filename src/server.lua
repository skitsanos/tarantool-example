-- Load the networking module
local http = require('http.server')

-- Create a new HTTP server
local server = http.new('0.0.0.0', 3000)

-- Define a request handler function
local function api_index_handler(req)
    -- Create a response object
    local resp = req:render({ json = {
        message = 'Hello, World!'
    } })

    -- Set the response headers
    resp.headers['Content-Type'] = 'application/json'

    -- Return the response
    return resp
end

-- Register the request handler
server:route({ path = '/' }, api_index_handler)

-- Start the server
server:start()
