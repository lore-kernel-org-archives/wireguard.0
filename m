Return-Path: dsa@cumulusnetworks.com
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
 [209.85.192.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5019b665
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Nov 2016 15:24:01 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id c4so24905533pfb.1
 for <wireguard@lists.zx2c4.com>; Tue, 15 Nov 2016 07:26:44 -0800 (PST)
Return-Path: <dsa@cumulusnetworks.com>
To: Hannes Frederic Sowa <hannes@stressinduktion.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <1479141867.3723362.787321689.4A3DCFD6@webmail.messagingengine.com>
 <fd1c804d-3e44-0321-8a3e-67d6ff7357fa@cumulusnetworks.com>
 <7d8c0210-9132-c755-9053-6ec19409e343@stressinduktion.org>
 <c75290bd-7ea2-0bf8-7ac0-fc5a3c81e312@cumulusnetworks.com>
 <7779da88-08dc-0adb-42dd-8e00502693df@stressinduktion.org>
 <0214eaf8-70c6-5a37-cddd-faa1c4268871@cumulusnetworks.com>
 <1479148385.3747043.787432273.5FCC2F4F@webmail.messagingengine.com>
 <CAHmME9ppx01YR9Db1oPpm6FJ+BmpqSxvjQ2S+GT0DXO09_M4oQ@mail.gmail.com>
 <7543fa0f-a053-8387-1862-d78ffadba688@stressinduktion.org>
From: David Ahern <dsa@cumulusnetworks.com>
Message-ID: <4285324b-c396-dfc1-caad-c961a6564e94@cumulusnetworks.com>
Date: Tue, 15 Nov 2016 08:26:42 -0700
MIME-Version: 1.0
In-Reply-To: <7543fa0f-a053-8387-1862-d78ffadba688@stressinduktion.org>
Content-Type: text/plain; charset=utf-8
Cc: Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
Subject: Re: [WireGuard] [PATCH v3] ip6_output: ensure flow saddr actually
 belongs to device
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 11/15/16 7:45 AM, Hannes Frederic Sowa wrote:

>> @@ -1012,6 +1013,16 @@ static int ip6_dst_lookup_tail(struct net *net,
>> const struct sock *sk,
>>          }
>>  #endif
>>
>> +        addr_type = ipv6_addr_type(&fl6->saddr);
>> +        if (addr_type == IPv6_ADDR_ANY)
>> +                return 0;
>> +
>> +        err = -EINVAL;
>> +        bind_to_dev = __ipv6_addr_src_scope(addr_type) <=
>> IPV6_ADDR_SCOPE_LINKLOCAL;
>> +        if (!ipv6_chk_addr(net, &fl6->saddr, bind_to_dev ?
>> (*dst)->dev : NULL, 0) &&
>> +            !ipv6_chk_acast_addr_src(net, (*dst)->dev, &fl6->saddr))
>> +                goto out_err_release;
>> +
>>          return 0;
>>
>>  out_err_release:
>>
> 
> We should not use (*dst)->dev, as this is the resulting device after the
> lookup and not necessarily corresponds to the device the user asked for.

To be consistent with IPv4 the saddr check is done before the lookup and dst and flow oif should not be used. Handling LL addresses are trickier and perhaps this is not the right place to enforce that check since it requires a specific device which is only really known after lookup. Why not add the if saddr is LL verification as part of the route selection? e.g, add something like rt6_device_match to ip6_pol_route (the device match call is only used for ip6_pol_route_lookup and not ip6_pol_route - why is that?).
