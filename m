Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09EC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Oct 2022 22:50:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ff4c7bf9;
	Wed, 19 Oct 2022 22:47:32 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ab343be5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2022 22:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H+T4qIkP6Ui0PIqVEKOfZkY3fpVlU5+uTrcTOAt+qeY=; b=S5J6aWAPsvMQfeXDIRFXzKCTYN
 HW/U2aVafrvTDFcIP6fnLPWfof0V+3ciMveYItU2XjPJRbA+1yWV8aQKR1LylPILjFqNy1LIET7v6
 EjhxR/90CC/h+eniehld8uGkWvi9xICkG2AQmHr5YDzX7TR0yTAb7lgqEgKrjWwm92Qc=;
Received: from [10.5.44.225] (port=22862 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLS1) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 (Exim 4.95) (envelope-from <mail@chil.at>) id 1olHq4-0003QP-1Y
 for wireguard@lists.zx2c4.com; Thu, 20 Oct 2022 00:47:24 +0200
Received: from [172.27.0.87] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Thu, 20 Oct 2022 00:45:47
 +0200
Message-ID: <f0137481-1664-00f2-e834-590813e28d97@chil.at>
Date: Thu, 20 Oct 2022 00:47:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Source IP selection or multi-home or multi-interface issue - solved
 with source-based route - was: Re: Wireguard source ip selection issue with
 multi interfaces
To: <wireguard@lists.zx2c4.com>
References: <CACu-5+0Z1JPCttbZpM13870N9Wce8K3V2ZRdhV6XFmVk4FJKxQ@mail.gmail.com>
 <60b5d439-e117-f3c7-3a6b-8ce46bc48fc2@chil.at>
From: Christoph Loesch <wireguard-mail@chil.at>
In-Reply-To: <60b5d439-e117-f3c7-3a6b-8ce46bc48fc2@chil.at>
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

Now I've read enough (rather old and also pretty recent) posts about that topic and I want to help finally fix this issue.

Not just because it bugs our network too after we optimized/simplified our router-setup but also because it seems over the years many users seem to be affected. Until now every thread I've read ends with an open question rather than a solution.

In Jason's post here from 2017 I found his script that should reproduce the issue, I tried it and could not reproduce the issue with that script..
To be honest I do not fully understand it to modify it to reproduce the issue in my environment.

Here I posted one example and the (temporary) solution by deleting the route that wireguard had set and re-creating the same route but defining the (correct) IP as src.
https://lists.zx2c4.com/pipermail/wireguard/2021-November/007324.html

How could I help to fix this issue?
If it helps, I could give full access to a test-router which has the same setup as all other routers in our network.

Kind regards


Am 23.11.2021 um 14:52 schrieb Christoph Loesch:
> Hi,
>
> Is this related to my issue with using wrong source ip on outgoing connections?
> (https://lists.zx2c4.com/pipermail/wireguard/2021-November/007307.html)
>
> Which bug would that be? Would be interesting in more detail to understand the issue.
> I'm having a hard time to reproduce (or somehow "fix") the issue I am facing, since this issue is on only 5 devices from over 20 devices where all are configured same.
>
> The configuration or better all routes do not even have any metric defined so I am unsure what to add/remove to change the behaviour.
> Also in my configuration there are multiple interfaces (br0,br1,eth0,eth1,etc..) as it is a router but there are no multiple default routes.
> Comparing perfectly fine working devices to one of those five devices which have this issue I am not able to find a difference in IP-config or routes.
> Even kernel and firmware versions are all same.
>
> The only difference I see is while looking at tcpdump where a simple ping to the wireguard server's internal IP (172.27.0.1/24 in my case) originates with the public IP of the device.
>
> If it is a known bug, it would be nice to know what (and if) I could try to fix and possibly confirm the bug. Or even better beeing able to reproduce the issue.
>
> Thanks and kind regards,
> Christoph
>
> Am 19.11.2021 um 14:10 schrieb 曹煜:
>> Hi,
>> As Jason said in mailing list
>> (https://lists.zx2c4.com/pipermail/wireguard/2017-November/002018.html)
>> years ago, if wireguard reply the client with wrong src ip, then it is
>> a bug. And now I'm trying to set up a minimal configuration.
>>
>> Server info:
>>
>> Ubuntu 20.04 in VMware with two Host-only network adapters:
>>
>> wacke@Ubuntu:/etc$ lsb_release -a
>> No LSB modules are available.
>> Distributor ID: Ubuntu
>> Description: Ubuntu 20.04.3 LTS
>> Release: 20.04
>> Codename: focal
>>
>> wacke@Ubuntu:/etc$ uname -a
>> Linux Ubuntu 5.14.8-051408-generic #202109280455 SMP Tue Sep 28
>> 04:57:31 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
>>
>> wacke@Ubuntu:/etc$ sudo ip route show
>> 169.254.0.0/16 dev ens33 scope link metric 1000
>> 172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
>> 192.168.187.0/24 dev ens33 proto kernel scope link src 192.168.187.129
>> metric 100
>> 192.168.187.0/24 dev ens35 proto kernel scope link src 192.168.187.128
>> metric 101
>> 192.168.199.0/24 dev wg0 proto kernel scope link src 192.168.199.1
>>
>> wacke@Ubuntu:/etc$ sudo cat /etc/wireguard/wg0.conf
>> [Interface]
>> PrivateKey = oLLeTlvwWsfGoyQpDwZo0k7AsMf0LkkfycGPwFjamEA=
>> ListenPort = 5999
>>
>> [Peer]
>> PublicKey = JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
>> AllowedIPs = 192.168.199.2/32
>> PersistentKeepalive = 25
>>
>> [Peer]
>> PublicKey = keIPXZFgvB79biV74kGc5R9vAHpzyVyQHci8KBSDIUw=
>> AllowedIPs = 192.168.199.3/32
>> PersistentKeepalive = 25
>>
>> wacke@Ubuntu:/etc$ sudo wg setconf wg0 /etc/wireguard/wg0.conf
>> wacke@Ubuntu:/etc$ sudo ip address add dev wg0 192.168.199.1/24
>> wacke@Ubuntu:/etc$ sudo ip link set up dev wg0
>> wacke@Ubuntu:/etc$ sudo wg show
>> interface: wg0
>>    public key: Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
>>    private key: (hidden)
>>    listening port: 5999
>>
>> peer: JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
>>    endpoint: 192.168.187.1:35560
>>    allowed ips: 192.168.199.2/32
>>    transfer: 2.89 KiB received, 1.80 KiB sent
>>    persistent keepalive: every 25 seconds
>>
>> peer: keIPXZFgvB79biV74kGc5R9vAHpzyVyQHci8KBSDIUw=
>>    allowed ips: 192.168.199.3/32
>>    persistent keepalive: every 25 seconds
>>
>> Client info:
>>
>> HOME-Server:/NAS/Software/Software # uname -a
>> Linux HOME-Server 5.14.14-2-default #1 SMP Thu Oct 21 05:05:03 UTC
>> 2021 (2b5383f) x86_64 x86_64 x86_64 GNU/Linux
>>
>> HOME-Server:/NAS/Software/Software # cat wg0.conf
>> [Interface]
>> PrivateKey = 4Pw1cetxd9TdfH3TSab+9UcRBlHwZ1o/vmrUgkerZls=
>>
>> [Peer]
>> PublicKey = Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
>> Endpoint = 192.168.187.128:5999
>> AllowedIPs = 192.168.199.0/24
>> PersistentKeepalive = 25
>>
>> HOME-Server:/NAS/Software/Software # ip link add wg0 type wireguard
>> HOME-Server:/NAS/Software/Software # ip address add dev wg0 192.168.199.2/24
>> HOME-Server:/NAS/Software/Software # wg setconf wg0 wg0.conf
>> HOME-Server:/NAS/Software/Software # ip link set wg0 up
>> HOME-Server:/NAS/Software/Software # wg show
>> interface: wg0
>>    public key: JYvK2/FBbbSrDbkH29ejWejkBJS3ch/SFtyZwNf5O1c=
>>    private key: (hidden)
>>    listening port: 53058
>>
>> peer: Vkdx0MhQkc9anLaUehR/Df1zuKjxceflxMCAeAaCWCo=
>>    endpoint: 192.168.187.128:5999
>>    allowed ips: 192.168.199.0/24
>>    transfer: 0 B received, 59.26 KiB sent
>>    persistent keepalive: every 25 seconds
>>
>>
>> tcpdump of client side:
>>
>> HOME-Server:/NAS/Software/Software # tcpdump -i any -vn "(dst port 5999)"
>> tcpdump: data link type LINUX_SLL2
>> tcpdump: listening on any, link-type LINUX_SLL2 (Linux cooked v2),
>> snapshot length 262144 bytes
>> 22:10:37.794301 vmnet1 Out IP (tos 0x88, ttl 64, id 54724, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:10:43.170306 vmnet1 Out IP (tos 0x88, ttl 64, id 55327, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:10:48.546281 vmnet1 Out IP (tos 0x88, ttl 64, id 56142, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:10:53.670343 vmnet1 Out IP (tos 0x88, ttl 64, id 57053, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:11:18.754308 vmnet1 Out IP (tos 0x88, ttl 64, id 58505, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:11:24.130286 vmnet1 Out IP (tos 0x88, ttl 64, id 58621, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:11:29.506305 vmnet1 Out IP (tos 0x88, ttl 64, id 58810, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> 22:11:34.882326 vmnet1 Out IP (tos 0x88, ttl 64, id 59444, offset 0,
>> flags [none], proto UDP (17), length 176)
>>      192.168.187.1.53058 > 192.168.187.128.5999: UDP, length 148
>> ^C
>> 8 packets captured
>> 8 packets received by filter
>> 0 packets dropped by kernel
>>
>> tcpdump of server side:
>>
>> wacke@Ubuntu:~$ sudo tcpdump -i any -vn "(src port 5999)"
>> tcpdump: listening on any, link-type LINUX_SLL (Linux cooked v1),
>> capture size 262144 bytes
>> 22:10:11.754862 IP (tos 0x88, ttl 64, id 22024, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:16.874400 IP (tos 0x88, ttl 64, id 22399, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:21.994433 IP (tos 0x88, ttl 64, id 23057, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:27.370558 IP (tos 0x88, ttl 64, id 23912, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:32.494605 IP (tos 0x88, ttl 64, id 24944, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:37.610779 IP (tos 0x88, ttl 64, id 25327, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:42.986834 IP (tos 0x88, ttl 64, id 25498, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:48.362908 IP (tos 0x88, ttl 64, id 26521, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:10:53.486942 IP (tos 0x88, ttl 64, id 27214, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:11:18.571437 IP (tos 0x88, ttl 64, id 31112, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:11:23.947460 IP (tos 0x88, ttl 64, id 31897, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:11:29.323608 IP (tos 0x88, ttl 64, id 32715, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> 22:11:34.699676 IP (tos 0x88, ttl 64, id 33840, offset 0, flags
>> [none], proto UDP (17), length 120)
>>      192.168.187.129.5999 > 192.168.187.1.53058: UDP, length 92
>> ^C
>> 13 packets captured
>> 13 packets received by filter
>> 0 packets dropped by kernel
>>
>> As the tcpdump log showed, the wireguard server always chose the ip
>> with lowest metric as source ip (192.168.187.129) to reply to the
>> client (while the client tried to connect 192.168.187.128).
>>
>> Hope the info above can help to debug. Many thanks.
