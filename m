Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69C2C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 00:12:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3EF61526
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Nov 2021 00:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE3EF61526
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f36580a0;
	Fri, 19 Nov 2021 00:12:02 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9f757316
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 00:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=geZBIMyNhbDg5Xa0kCj6TQHoTHMv/rt179uYMBppBKE=; 
 b=TfBhFh1TkIFEkCMcCvCR97S5ijVaqAmwYHq4lMM9GA1b+U8vmJ1Xgj/WqEcmgFtWCbQCdYO9YmLx48Q8gL4WvoLEuvLK+QQFqnpOsY2iaQcD6LwHBAj1P1KbKHrwX0HPe4Wa8EQCgDRFg0VlAR14h86qNS0MPgccoxW7RHE0qAs=;
Received: from [10.5.44.225] (port=15109 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1mnrVW-0003Cc-0g
 for wireguard@lists.zx2c4.com; Fri, 19 Nov 2021 01:11:58 +0100
Received: from [172.27.0.88] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Fri, 19 Nov 2021 01:11:57
 +0100
X-CTCH-RefID: str=0001.0A682F1D.6196EBCE.001D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <744d7291-e43b-4e8c-76be-c78c11204e17@chil.at>
Date: Fri, 19 Nov 2021 01:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: client uses wrong source ip for outgoing connections
Content-Language: de-AT
To: <wireguard@lists.zx2c4.com>
References: <d60ce240-5bb3-eed7-85a0-31d05cb0133e@chil.at>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <d60ce240-5bb3-eed7-85a0-31d05cb0133e@chil.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.5.44.244]
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

if relevant, some more details about interface and routes from good and bad example to compare:

root@eng196-router:~# ip a sh wg0
46: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
     link/none
root@eng196-router:~# ip r sh dev wg0
10.5.44.0/24 scope link
172.27.0.0/24 scope link
root@eng196-router:~# ip a sh br1
11: br1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
     link/ether 44:d9:e7:x:y:z brd ff:ff:ff:ff:ff:ff
     inet 10.29.85.100/24 brd 10.29.85.255 scope global br1
        valid_lft forever preferred_lft forever
     inet6 fe80::7c4c:1dff:fe84:fece/64 scope link
        valid_lft forever preferred_lft forever

root@zi1-router:~# ip a sh wg0
18: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
     link/none
root@zi1-router:~# ip r sh dev wg0
10.5.44.0/24 scope link
172.27.0.0/24 scope link
root@zi1-router:~# ip a sh br1
12: br1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
     link/ether 74:83:c2:x:y:z brd ff:ff:ff:ff:ff:ff
     inet 10.34.0.100/24 brd 10.34.0.255 scope global br1
        valid_lft forever preferred_lft forever
     inet6 fe80::2c2e:76ff:fedc:d8e/64 scope link
        valid_lft forever preferred_lft forever

Am 19.11.2021 um 00:40 schrieb Christoph Loesch:
> Hi,
>
> I am using wireguard on about 20 EdgeRouters (based on Debian stretch).
> Each router has exact same configuration (apart from router ip addresses and wireguard keys/passphrases).
> Works very well on most of them but on five routers wireguard uses the wrong ip address for outgoing connections over the tunnel.
> All routers use kernel 4.14.54-UBNT and wireguard-tools v1.0.20210914
> Wireguard debian package is from github/WireGuard/wireguard-vyatta-ubnt
>
> On the problematic routers the public ip address is used for the tunnel instead the private ip address.
> Interestingly even in the bad example the wg tunnel is running and the server can reach the routers(=wg clients), but not the other way round.
>
> In the following examples 172.27.0.1 is the wireguard server internal ip address.
> Routers use ip addresses in the 10.0.0.0/8 range for the wg tunnel which are allowed on the server.
> I already even debugged this with tcpdump where I found out it uses the wrong ip.
> But looking at a simple ping you also notice the wrong ip after the word "from".
>
> Good example:
> eng196-router:~$ \ping -I wg0 -c1 172.27.0.1
> ping: Warning: source address might be selected on device other than wg0.
> PING 172.27.0.1 (172.27.0.1) from 10.29.85.100 wg0: 56(84) bytes of data.
> 64 bytes from 172.27.0.1: icmp_seq=1 ttl=64 time=6.82 ms
> --- 172.27.0.1 ping statistics ---
> 1 packets transmitted, 1 received, 0% packet loss, time 0ms
> rtt min/avg/max/mdev = 6.826/6.826/6.826/0.000 ms
>
> Bad example:
> zi1-router:~$ \ping -I wg0 -c1 172.27.0.1
> ping: Warning: source address might be selected on device other than wg0.
> PING 172.27.0.1 (172.27.0.1) from 78.41.x.y wg0: 56(84) bytes of data.
> --- 172.27.0.1 ping statistics ---
> 1 packets transmitted, 0 received, 100% packet loss, time 0ms
>
> Configurations:
> eng196-router:~# wg
> interface: wg0
>   public key: SoV2obcH0qWfCRY3gZbkLNeMa1QRcnhNDCeiI9weszA=
>   private key: (hidden)
>   listening port: 58205
> peer: 1syRMYD1jIVFMUMm5hF/j0MzjMQmuC5mlcT1VVugIkU=
>   preshared key: (hidden)
>   endpoint: 86.59.x.y:1024
>   allowed ips: 172.27.0.0/24, 10.5.44.0/24
>   latest handshake: 53 seconds ago
>   transfer: 24.57 MiB received, 26.48 MiB sent
>   persistent keepalive: every 25 seconds
>
> zi1-router:~# wg
> interface: wg0
>   public key: aYtVhblpR0XSsAb/dXF3zM9Hu+LxlvrR5RWFU2psF3M=
>   private key: (hidden)
>   listening port: 45514
> peer: 1syRMYD1jIVFMUMm5hF/j0MzjMQmuC5mlcT1VVugIkU=
>   preshared key: (hidden)
>   endpoint: 86.59.x.y:51820
>   allowed ips: 172.27.0.0/24, 10.5.44.0/24
>   latest handshake: 13 seconds ago
>   transfer: 1.79 MiB received, 6.26 MiB sent
>   persistent keepalive: every 25 seconds
>
> What could cause the wrong selection?
> Why does that work for most routers but for some not? There must be some difference or something gets confused up by specific ip addresses I guess?
> How could I debug this further to find the difference and/or cause for this problem?
>
> Thanks for any hints and kind regards,
> Christoph
>
