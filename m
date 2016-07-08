Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id ada357af
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 13:40:37 +0000 (UTC)
Date: Fri, 8 Jul 2016 08:39:59 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: William <william@undefined.re>
Message-ID: <20160708133959.GA10923@wolff.to>
References: <20160708123412.11412-1-Jason@zx2c4.com>
 <20160708130320.xw2h4zwduw4nfarg@daban-urnud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20160708130320.xw2h4zwduw4nfarg@daban-urnud>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [PATCH] persistent keepalive: start sending
 immediately
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 08, 2016 at 15:03:20 +0200,
  William <william@undefined.re> wrote:
>On Fri, Jul 08, 2016 at 02:34:12PM +0200, Jason A. Donenfeld wrote:
>> Rather than only start sending the persistent keepalive packets when the
>> device first sends data, this changes it to send the packets immediately
>> on `ip link set up`. This makes things generally seem more stateless,
>> since the administrator does not have to manually ping the endpoint.

>> I haven't merged this yet, and I'm debating whether it's something we want.
>> I'm open to all opinions here, so feed back would be most welcome.

>just to have a trace here of what I pointed out on IRC:
>In the case of making a peer accessible through a NAT "I don't want to
>have to manually ping things from the client I'm trying to ssh to in the
>first place".

If you want to save people from sending data through the tunnel using 
pings (or whatever), you need to start holding the tunnel open when 
the device comes up. The whole point is to make the end point available 
to remotely initiated connections. Waiting for manually entered data 
does work. (Though you could just send one ping packet to start things 
rather than send them continuously as before this feature was added.)
