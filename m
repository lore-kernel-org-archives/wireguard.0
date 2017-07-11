Return-Path: jomat+wireguard.io@jmt.gr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63692153
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 12:46:27 +0000 (UTC)
Received: from mx0.jmt.gr (mx0.jmt.gr [81.7.7.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ddcf2341
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 12:46:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 11 Jul 2017 13:04:40 +0000
From: jomat+wireguard.io@jmt.gr
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: Debian-based configuration for wireguard
In-Reply-To: <87ziccyoo1.fsf@fifthhorseman.net>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr> <20170710025323.GC31153@zx2c4.com>
 <1499716437.988.1.camel@eggiecode.org> <87ziccyoo1.fsf@fifthhorseman.net>
Message-ID: <71133f541e1824a0eeb5e2e624aa1f2f@jmt.gr>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

>  * it looks to me like configuring a wireguard link this way will
>    require an entry in /etc/network/interfaces (or interfaces.d) *and* 
> a
>    config file in /etc/wireguard/*.conf.  It seems like it would be
>    cleaner to have all the configuration in one place, no?

/etc/network/interfaces is usually world readable, /etc/wireguard/ not
as your private keys are stored there.

Bye,
jomat
