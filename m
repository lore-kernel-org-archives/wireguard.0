Return-Path: bruno@wolff.to
Date: Wed, 6 Jul 2016 07:04:10 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: WireGuard@lists.zx2c4.com
Message-ID: <20160706120410.GA765@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

While wgserver.service is going to need some customization for each 
instance, there are a couple of things you might want to change in the 
example.

If for whatever reason wgserver is left setup, starting and restarting 
the service will fail until the device is manually removed.
Adding the following as the first ExecStart will help:
ExecStart=-/bin/ip link del dev wgserver
That will attempt to clean up any left over device as part of the 
startup process. Which will keep:
ExecStartPre=/usr/sbin/ip link add dev wg0 type wireguard
from failing (exit status 2 if the device already exists) and aborting 
the service startup.

Also according to the systemd documentation, ExecStopPost commands are 
supposed to be run when starting fails. It doesn't seem to actually work 
this way on Fedora and I have filed a bug about it. But it may still 
be better to change:
ExecStop=/bin/ip link del dev wgserver
To:
ExecStopPost=/bin/ip link del dev wgserver

Another note, that I'm not sure there is a standard fix for, but might 
be worth throwing in something for, is that if your config has a host 
name in it, you need functioning DNS when the service starts. And hence 
one may want to add Requires= and After= for a DNS service in some cases.

The example was helpful to me in figuring out the service files I am 
actually using on my two endpoints.
