# Chukan
An automation library for distributed systems.


## Basic usage

    #!/usr/bin/env ruby
    require 'chukan'
    include Chukan                     # include Chukan
    
    srv = spawn("server -arg1 -arg2")  # run 'server' command
                                       # with '-arg1 -arg2' arguments
    srv.stdout_join("started")         # wait until the server outputs "started"
    
    cli = spawn("client -arg1 -arg2")  # run 'client' command with some arguments
    srv.stdout_join("connected")       # wait until the server outputs "connected"
    
    cli.kill                           # send SIGKILL signal to the client
    cli.join                           # wait until the client is really dead
    srv.stderr_join(/disconnected/)    # stderr and regexp are also available
    
    srv.stdin.write "status\n"         # input "status\n" to the server
    srv.stdout_join("done")            # wait until the server outputs "done"
    
    if srv.stdout.read =~ /^client:/   # read output of the server
      puts "** TEST FAILED **"         # this library is usable for tests
                                       # see also "Unit test" example below
    end


## Remote process execution

    #!/usr/bin/env ruby
    require 'chukan'
    include Chukan                     # include Chukan
    
    mac = remote("mymac.local")        # login to the remote host using ssh and run
                                       # commands on the host
                                       # use ssh-agent if your key is encrypted
    mac.cd("work/myproject")           # run on "work/myproject" directory
    
    linux = remote("192.168.10.2", "myname", ".id_rsa_linux")
                                       # user name and path of the key are optional
    
    cli_on_mac   = mac.spawn("client -arg1")   # run 'client' on the remote host
    cli_on_linux = linux.spawn("client -arg1")
    
    cli_on_mac.stdout_join("started")  # signals and I/Os are also available


## Unit test

    #!/usr/bin/env ruby
    require 'chukan'
    include Chukan::Test               # include Chukan::Test
    
    test "load mylibrary"  do          # Chukan::Test provides 'test' and 'run' methods
      require "mylibrary"              # test will fail if the block returns nil or false,
                                       # or an exception is raised
    end
    
    run {|b|                           # 'run' iterates YAML documents written after
                                       # __END__ line
      test "score <= 100", :TODO  do   # second argument of 'test' is :TODO or :SKIP
        b.score <= 100                 # which is useful for Test Anything Protocol
      end                              # (TAP) processor like 'prove'
    }
    
    __END__
    ---                                # YAML documents are here
    name:  test A
    user:  a-san
    score: 10
    ---
    name:  test B
    user:  b-san
    score: 100


## License
    Copyright (c) 2009 FURUHASHI Sadayuki
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

