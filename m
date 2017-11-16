Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a35c4fe
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 11:17:57 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b1b2fd8
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 11:17:56 +0000 (UTC)
Date: Thu, 16 Nov 2017 12:22:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: ds@fastmail.fm
Subject: Re: disabling ipv6 with wg-quick
Message-ID: <20171116112222.GA22221@kroah.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Nov 16, 2017 at 11:04:49AM +0100, ds@fastmail.fm wrote:
> Hi,
> 
> Is there a way to disable ipv6 when using wg-quick?
> 
> If I have the following line on my conf file:
> 
> Address = xx.xx.x.39/32,xxxx:xxxx:xxx:bb01::327/128
> 
> wg-quick will fail with the following error:
> 
>  ~ 2   wg-quick up mullvad-se2    
> [#] ip link add mullvad-se2 type wireguard
> [#] wg setconf mullvad-se2 /dev/fd/63
> [#] ip address add  xx.xx.x.39/3 dev mullvad-se2
> [#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2
> RTNETLINK answers: Permission denied
> 
> I have ip6 disabled in my system.
> 
> Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still sets ups
> some ipv6 routes `ip -6 ..` etc.
> 
> Is there a way to use ipv4 only with wg-quick?

I placed the following in the [Interface] section of the configuration
file to achieve this:
	PreUp = sysctl net.ipv6.conf.all.disable_ipv6=1
	PostDown = sysctl net.ipv6.conf.all.disable_ipv6=0

It's a horrid hack, but does seem to work.

hope this helps,

greg k-h
