Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb18c834
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:01:30 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fded9647
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:01:30 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: jomat+wireguard.io@jmt.gr
Subject: Re: Debian-based configuration for wireguard
In-Reply-To: <71133f541e1824a0eeb5e2e624aa1f2f@jmt.gr>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr> <20170710025323.GC31153@zx2c4.com>
 <1499716437.988.1.camel@eggiecode.org> <87ziccyoo1.fsf@fifthhorseman.net>
 <71133f541e1824a0eeb5e2e624aa1f2f@jmt.gr>
Date: Tue, 11 Jul 2017 18:19:45 -0400
Message-ID: <871spmzke6.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue 2017-07-11 13:04:40 +0000, jomat+wireguard.io@jmt.gr wrote:
> [ dkg wrote: ]
>>  * it looks to me like configuring a wireguard link this way will
>>    require an entry in /etc/network/interfaces (or interfaces.d) *and* 
>> a
>>    config file in /etc/wireguard/*.conf.  It seems like it would be
>>    cleaner to have all the configuration in one place, no?
>
> /etc/network/interfaces is usually world readable, /etc/wireguard/ not
> as your private keys are stored there.

Good point!  it'd be great to be able to separate the private key
information from the standard network information for that reason; it's
not like people can't inspect the rest of the network config once the
device is configured, so it would be nice to be able to just have the
private key in an isolated file.

        --dkg
