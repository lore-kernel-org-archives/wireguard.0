Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id bdd3d00b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 16:24:15 +0000 (UTC)
Date: Fri, 8 Jul 2016 11:23:37 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160708162337.GA5566@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <278721635a23c243@frisell.zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160708.1`
 Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 08, 2016 at 16:37:23 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>== Changes ==
>
>  * persistent keepalive: start sending immediately -- the previously released
>    feature was not useful without this extra commit. So, getting this in here
>    now so that people can actually test this out. Sorry for the churn. Don't
>    bother packaging the previous snapshot.

I tried this an noticed a problem. The keep alive packets don't set the 
reply IP address and port for the endpoint. (Which makes sense since they 
aren't authenticated.) So in the case of nat, where you won't know what 
the port is (and in some cases the IP address as well) you still can't 
connect to the end point behind the nat until there is some authenticated 
data sent from the end point.

So if nat changes the port at some point, in order to reestablish a path, 
you need to send authenticated data. I am not thinking of an obvious way 
to tell when you just need to hold the port mapping via nat open versus 
when you need to send authenticated data to rebuild a connection after 
a port or IP address change from nat.
