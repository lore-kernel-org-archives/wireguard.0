Return-Path: <SRS0=Gm1R=NW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MISSING_HEADERS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E58C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Aug 2021 14:47:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9DCD6103D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Aug 2021 14:47:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9DCD6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a25ff93d;
	Tue, 31 Aug 2021 14:47:04 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [2607:f8b0:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d66eea3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Aug 2021 14:47:01 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id g8so20223974ilc.5
 for <wireguard@lists.zx2c4.com>; Tue, 31 Aug 2021 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=Jqv6x73RUyqRv3VkOXM6peGb8yWq9XWKuZ3e0feGV+Y=;
 b=uCcOjqbBO4kh7nxWHK8O0KC2aGHx9EICrEchuxSIBxsuAxEax0Ba8Zc2wtVDfNwPsn
 venD4uXvfOZA1S3EolhE6aqc8p52Cm05VhOwGGMt2FShGymcxa34dAPn3ODyasDuis+V
 z8Y8o46lQWDkjCUPS/mmjE4CMh52HGuKazXE8Io1MtdqTbgvj4Empm8hCEpuzfRj/Ehp
 0R85JhHWfOLCQkqTC9v9uYuIBJemx7kV3sHJdhVNGgX96ziLfLq/n61u1baf3KuyqifZ
 bz5d2RBvHbLo7P0krd7OKsVbRLQ7JoPGVYXGfAKfG8fv/OvdqTAcKfSW/SCUg4ZPnQN4
 VDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=Jqv6x73RUyqRv3VkOXM6peGb8yWq9XWKuZ3e0feGV+Y=;
 b=VmWQWa04SniewHOoKCU/QCvSaQfpgSATPyVU9uyHjr2sB7iiyP09McWGhQbld8VFvs
 2uYcln1vyyzC5zl7Ud/F0BAYIDeXGzuZB5rX3xxhcNiL3nQKQrxm0XHU+SsANdRy1+wW
 uG/IQCKX5vraTQa8tXvub2SGvAfKogYKrK8N5kJlU5Rup6Nz0snotWjvGTAhAL4YdKXu
 g/3wXDzRiNvjyGyDJNx6/lDYh4O21+tcbYAjVLpe7fITeeJ7MN0rVCT2NtpzldgpyqZy
 jnhPlQJ5GTRUyLdpu4kFBfVPtlC2oiEWsiBuHbElzedDU+rfejAlVhXo4Izafn3CDnGa
 Qnbw==
X-Gm-Message-State: AOAM530gy8qo0id/RdrY/GwCYgXQovLyWrYBUIxuzF5BvIUkB4S0H9fu
 9+jsHk6YHrpIsWctxcoijMC22E17mEPJWD0YFKzyb9YDhl8=
X-Google-Smtp-Source: ABdhPJyFPNsaDbfWTUb9Lv3O35mM1aIch1cCeXBKsNGjAmPLJI7yYHiv1MLOrkgc5ihsg9OMMBvks9HLrcXVTZ4BH7Y=
X-Received: by 2002:a05:6e02:1294:: with SMTP id
 y20mr19474595ilq.42.1630421220175; 
 Tue, 31 Aug 2021 07:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
 <bc607757-8c13-6146-c7bd-50aad949de76@spam-free.eu>
 <CA+MSESmGoAuQJX3rn-a3aucV8YoD+pnrVtTVDaMu9EFuS=-mqg@mail.gmail.com>
In-Reply-To: <CA+MSESmGoAuQJX3rn-a3aucV8YoD+pnrVtTVDaMu9EFuS=-mqg@mail.gmail.com>
From: S Bauer <sanderbauer@gmail.com>
Date: Tue, 31 Aug 2021 16:46:33 +0200
Message-ID: <CA+MSESmdfkNZJkgNTXUBJAtYwkKSMT06JZS_5qUmVWNoRiSVdQ@mail.gmail.com>
Subject: Re: enabling WG0 allows telegram but impedes browsing
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hi all,

I found some time to troubleshoot properly.
Below I posted my outputs, responding to the different hints I
received from several of the mailinglist subscribers. (thanks for
helping)

The following is with WG0 disabled. Sending a ping to google and a
route to Reddit.

...:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=14.3 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=13.3 ms
.......seq=3 to seq=18....
64 bytes from 8.8.8.8: icmp_seq=19 ttl=117 time=10.1 ms
64 bytes from 8.8.8.8: icmp_seq=20 ttl=117 time=10.7 ms
^C
--- 8.8.8.8 ping statistics ---
20 packets transmitted, 20 received, 0% packet loss, time 19029ms
rtt min/avg/max/mdev = 9.892/15.839/90.310/17.462 ms

...:~$ host -v reddit.com
Trying "reddit.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46050
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;reddit.com. IN A

;; ANSWER SECTION:
reddit.com. 161 IN A 151.101.65.140
reddit.com. 161 IN A 151.101.193.140
reddit.com. 161 IN A 151.101.129.140
reddit.com. 161 IN A 151.101.1.140

Received 92 bytes from 127.0.0.53#53 in 15 ms
Trying "reddit.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43918
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;reddit.com. IN AAAA

Received 28 bytes from 127.0.0.53#53 in 23 ms
Trying "reddit.com"
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32760
;; flags: qr rd ra; QUERY: 1, ANSWER: 5, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;reddit.com. IN MX

;; ANSWER SECTION:
reddit.com. 300 IN MX 10 aspmx2.googlemail.com.
reddit.com. 300 IN MX 10 aspmx3.googlemail.com.
reddit.com. 300 IN MX 5 alt2.aspmx.l.google.com.
reddit.com. 300 IN MX 5 alt1.aspmx.l.google.com.
reddit.com. 300 IN MX 1 aspmx.l.google.com.

Received 158 bytes from 127.0.0.53#53 in 15 ms


...:~$ mtr -n reddit.com
                    My traceroute  [v0.94]
... (>my_IP<) -> reddit.com

2021-08-31T14:27:10+0200
Keys:  Help   Display mode   Restart statistics   Order of fields   quit

                                              Packets
Pings
 Host
                                            Loss%   Snt   Last   Avg
Best  Wrst StDev
 1. 10.160.243.129            0.0%     3   11.1   8.4   4.4  11.1   3.5
    >my_ip<
 2. 10.160.243.129          0.0%     3   11.8  11.4  11.1  11.8   0.4
 3. 212.142.52.193          0.0%     2   14.7  12.9  11.1  14.7   2.6
 4. 213.51.7.90                0.0%     2   12.3  10.9   9.5  12.3   2.0
 5. 213.51.64.58              0.0%     2   31.0  27.6  24.1  31.0   4.9
 6. 213.46.191.170          0.0%     2   12.8  11.4  10.1  12.8   1.9
 7. 151.101.1.140            0.0%     2   10.8  10.6  10.4  10.8   0.2

...:~$ ip route show
default via >my_ip< dev wlp0s20f3 proto dhcp metric 600
>my_ip</.. dev wlp0s20f3 scope link metric 1000
>my_ip</.. dev wlp0s20f3 proto kernel scope link src >my_ip< metric 600


The following is with WG0 enabled, let's see where things mess up.

..:~$ sudo wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add (hidden)/.. dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] ip -6 route add ::/0 dev wg0 table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[#] ip6tables-restore -n
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
[#] iptables-restore -n

...:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
^C
--- 8.8.8.8 ping statistics ---
11 packets transmitted, 0 received, 100% packet loss, time 10244ms

...:~$ host -v reddit.com
Trying "reddit.com"
;; connection timed out; no servers could be reached

...:~$ mtr -n reddit.com
no output

...:~$ ip route show
default via >my_ip< dev wlp0s20f3 proto dhcp metric 600
>my_ip</.. dev wg0 proto kernel scope link src >my_ip<
>my_ip</.. dev wlp0s20f3 scope link metric 1000
>my_ip</.. dev wlp0s20f3 proto kernel scope link src >my_ip< metric 600

So, apparently all fails when WG0 is enabled without any changes to the MTU.

Per advice from Roman I reduced the MTU to 1400.
...:~$ sudo ifconfig wg0 mtu 1400 up
Double checking by performing
...:~$ ip a
......
5: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1400 qdisc noqueue state
UNKNOWN group default qlen 1000
    link/none
    inet .../.. scope global wg0
       valid_lft forever preferred_lft forever

But even with the MTU lowered I get the following output.
...:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
^C
--- 8.8.8.8 ping statistics ---
17 packets transmitted, 0 received, 100% packet loss, time 16370ms

Trying even lower MTU.

...:~$ sudo ifconfig wg0 mtu 1200 up
(I also performed this step with
...:~$ sudo ip link set mtu 1200 up dev wg0 and confirmed with ip a
But this method did not produce a different result)
...:~$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
^C
--- 8.8.8.8 ping statistics ---
23 packets transmitted, 0 received, 100% packet loss, time 22521ms
...:~$ mtr -n reddit.com
no output

Am I missing something here?

Sander

Op do 26 aug. 2021 om 09:40 schreef S Bauer <sanderbauer@gmail.com>:
>
> Thank you all for the insights about MTU settings, DNS and routing.
> I am a bit caught up in work with important deadlines but will test all your advice soon as possible and inform everyone on the outcomes.
>
> Regards
> Sander
>
> Chris ccc:
>>
>> If I understand it right, everything seems fine BUT once wg is up you cannot
>> reach e.g. other websites.
>> Therefore you you try to track the route to say reddit. Command line:
>>
>> mtr -n reddit.com
>>
>> and then you will see at what point the data transport to reddit gets stuck.
>>
>> Also check (command line)
>>
>> host -v reddit.com
>>
>> to check on the correct DNS working.
>>
>> Chris
>>
>>
>> On 20/08/2021 13:16, S Bauer wrote:
>> > Hello team,
>> >
>> > Hoping you could help me out with a foggy situation.
>> > The past week I have been struggling to get the Wireguard VPN working
>> > smoothly. Everything seems to work on paper, except in a specific way
>> > it doesn't. I am using Pop!_OS 21.04 (Ubuntu Hirsute).
>> >
>> > SitRep;
>> > I work as a freelance consultant and want to be careful about the
>> > local networks' peeping tom when accessing sensitive work documents
>> > from 'out of office', e.g. at a friend's place or at a hotel. So my
>> > objective is to access my home network via PiHole and then continue
>> > onward to access my work-related documents on a fileserver.
>> > I was hoping this could be easily achieved with Wireguard.
>> >
>> > Using the Wireguard VPN wg0 with wg-quick worked perfectly when I
>> > connected to my brother's phone hotspot (4G). I could access our home
>> > via VPN as expected and could work on my documents without any
>> > problems.
>> > The trouble is that I am now at a different location, working with a
>> > fixed router from Ziggo NL. For some reason the WG0 still connects
>> > perfectly, but after that a small mystery occurs. I did not make any
>> > modifications to WG0.conf, so I remain stumped.
>> > With WG active, I am no longer able to access any webpage. So no
>> > access to protonmail\gmail, reddit or anything else. Telegram,
>> > however, is still working fine. Internal machines on the home's local
>> > network (IP-camera) can also be accessed directly.
>> > Disabling the WG gives me full access to any webpage as usual. So
>> > something is amiss that affects my browser only (Firefox 91.0).
>> >
>> > I already did some troubleshooting. Starting with Uncomplicated
>> > Firewall (UFW). I tried disabling UFW and rebooting, but this did not
>> > change anything. I still lacked browser access when connected with
>> > WG0, but Telegram still worked fine.
>> > The output from sudo wg is;
>> > interface: wg0
>> > public key: (hidden)
>> > private key: (hidden)
>> > listening port: <portnumber>
>> > fwmark: 0xca6c
>> >
>> > peer: (hidden)
>> > preshared key: (hidden)
>> > endpoint: >our_endpoint_name<.ddns.net:51820
>> > allowed ips: 0.0.0.0/0, ::/0
>> > latest handshake: 3 seconds ago
>> > transfer: 92 B received, 4.77 KiB sent
>> >
>> > To be on the safe side, I added several rules to UFW (and reloaded UFW
>> > each time) per advice from
>> > https://jianjye.medium.com/how-to-fix-no-internet-issues-in-wireguard-ed8f4bdd0bd1
>> > , leaving me with the following output from ufw status verbose. (But
>> > like I said, the problem occurs even with UFW disabled.)
>> > Status: active
>> > Logging: on (low)
>> > Default: deny (incoming), allow (outgoing), deny (routed)
>> > New profiles: skip
>> >
>> > To Action From
>> > -- ------ ----
>> > Anywhere/udp on wg0 ALLOW IN Anywhere/udp
>> > <portnumber>/udp ALLOW IN Anywhere
>> > <portnumber>/udp ALLOW IN Anywhere
>> > <portnumber>/udp on wlp0s20f3 ALLOW IN Anywhere
>> > Anywhere/udp on wlp0s20f3 ALLOW IN Anywhere/udp
>> > <portnumber> on wlp0s20f3 ALLOW IN Anywhere
>> > Anywhere/udp (v6) on wg0 ALLOW IN Anywhere/udp (v6)
>> > <portnumber>/udp (v6) ALLOW IN Anywhere (v6)
>> > <portnumber>/udp (v6) ALLOW IN Anywhere (v6)
>> > <portnumber>/udp (v6) on wlp0s20f3 ALLOW IN Anywhere (v6)
>> > Anywhere/udp (v6) on wlp0s20f3 ALLOW IN Anywhere/udp (v6)
>> > <portnumber> (v6) on wlp0s20f3 ALLOW IN Anywhere (v6)
>> >
>> > Anywhere on eth0 ALLOW FWD Anywhere on wg0
>> > Anywhere on wg0 ALLOW FWD Anywhere on eth0
>> > Anywhere on wg0 ALLOW FWD Anywhere on enp40s0
>> > Anywhere on enp40s0 ALLOW FWD Anywhere on wg0
>> > Anywhere on wlp0s20f3 ALLOW FWD Anywhere on wg0
>> > Anywhere on wg0 ALLOW FWD Anywhere on wlp0s20f3
>> > Anywhere (v6) on eth0 ALLOW FWD Anywhere (v6) on wg0
>> > Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on eth0
>> > Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on enp40s0
>> > Anywhere (v6) on enp40s0 ALLOW FWD Anywhere (v6) on wg0
>> > Anywhere (v6) on wlp0s20f3 ALLOW FWD Anywhere (v6) on wg0
>> > Anywhere (v6) on wg0 ALLOW FWD Anywhere (v6) on wlp0s20f3
>> >
>> > Now all these rules may be barbaric overkill, and yes I will admit
>> > that I have a limited understanding of what everything means and how
>> > it affects my security. Though I am a linux newcomer and employ
>> > duckduckgo to the best of my abilities the learning curve is still
>> > pretty much in effect. That being said, do feel free to point out any
>> > serious flaws I may have unwittingly introduced or simply push me
>> > towards some longreads ;)
>> >
>> > Any hints on solving this issue are appreciated.
>> >
>> >
>> > Additional notes;
>> > * the DDNS in wg0.conf is properly translated to an IP address each
>> > time. So that seems to be no issue.
>> > * I am currently using the Dutch Ziggo network, which already seems to
>> > have a reputation concerning the use of VPN applications. Maybe the
>> > issue lies herein?
>> > * Should I consider this relevant? >
>> > https://github.com/pop-os/pop/issues/773 I am a bit cautious about
>> > doing more random stuff before actually understanding what is going
>> > on.
>> >
>> > Regards,
>> > Sander
>>
>>
