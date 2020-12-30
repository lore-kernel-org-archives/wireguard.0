Return-Path: <SRS0=dquF=GC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C01C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Dec 2020 09:29:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208B420791
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Dec 2020 09:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208B420791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sager.me.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 901cda62;
	Wed, 30 Dec 2020 09:19:06 +0000 (UTC)
Received: from mail267c50.megamailservers.eu (mail1457c50.megamailservers.eu
 [91.136.14.57])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f1d63ce
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Dec 2020 09:19:04 +0000 (UTC)
X-Authenticated-User: sagermail@sager.me.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1609320553;
 bh=aiHpNk9cpJoxjUULNADzfyaFBPUfLfyfQbD6AxTZxTs=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=I1wMHzRxAENgZ+zRddKfA/twmvh2QFDV4EBMnFz8z/IyFXLGx1dJt1HhnAecVZ4VM
 qWjsLmi1IMHECUUZa0rgwZLQmNOmh15/+fCxP6g6msU122/beco1/cIXwNMmMKdtXz
 SYTHiWyebdfw8eQG4oiEzE5eusM26ipaah1EK4bE=
Feedback-ID: john@sager.me.u
Received: from mainserver.wc (97.83.2.81.in-addr.arpa [81.2.83.97])
 (authenticated bits=0)
 by mail267c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 0BU9TB4a003033
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <wireguard@lists.zx2c4.com>; Wed, 30 Dec 2020 09:29:13 +0000
Received: from
 2.4.d.9.3.d.5.2.1.f.d.d.2.0.9.6.0.0.0.0.3.e.b.c.0.b.8.0.1.0.0.2.ip6.arpa
 ([2001:8b0:cbe3:0:6902:ddf1:25d3:9d42])
 by mainserver.wc with esmtp (Exim 4.93)
 (envelope-from <john@sager.me.uk>) id 1kuXn5-0040Fb-DY
 for wireguard@lists.zx2c4.com; Wed, 30 Dec 2020 09:29:11 +0000
Subject: Re: wg-crypt-wg0 process
To: wireguard@lists.zx2c4.com
References: <d56b4194-2b74-b440-c102-3b379daa8194@gmail.com>
From: John Sager <john@sager.me.uk>
Message-ID: <2e16043e-ddd2-c583-820c-73e476c2eaea@sager.me.uk>
Date: Wed, 30 Dec 2020 09:29:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d56b4194-2b74-b440-c102-3b379daa8194@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CTCH-RefID: str=0001.0A742F1D.5FEC4869.0023:SCFSTAT79219218, ss=1, re=-4.000,
 recu=0.000, reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: -4.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=arrM9hRV c=1 sm=1 tr=0 a=dws6IJh5fU+Ftmrx3Eq8JA==:117
 a=dws6IJh5fU+Ftmrx3Eq8JA==:17 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zTNgK-yGK50A:10 a=YBwOTgHewPRH2o07jF8A:9 a=_JQHZ0YQ79PmpNgR:21
 a=QEXdDO2ut3YA:10
X-Origin-Country: GB
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

The posted script works for me, Xubuntu 20.04 kernel 5.4.0-38-generic 
x86_64. The first time I ran it, it deleted both [wg-crypt-wg0] instances 
but left one kworker process: [kworker/0:0-wg-crypt-wg0]. I then ran it 
again and no wg kernel processes were left.

regards,

John

On 30/12/2020 08:19, Fatih USTA wrote:
> Hi
> 
> I'm playing wireguard with the namespace. I think I caught a litle problem.
> 
> If I delete netns directly, everything is removed, but wg-crypt-wg0 process 
> is still alive.
> 
> root      8127  0.0  0.0      0     0 ?        S<   07:26 0:00 [wg-crypt-wg0]
> root      8143  0.0  0.0      0     0 ?        S<   07:26 0:00 [wg-crypt-wg0]
> root      8449  0.0  0.0      0     0 ?        S<   07:26 0:00 [wg-crypt-wg0]
> root      8454  0.0  0.0      0     0 ?        S<   07:26 0:00 [wg-crypt-wg0]
> 
> If I delete first wireguard interface from the netns, everthing works fine.
> 
> wg_version:        1.0.20201221
> kernel_version:       3.16.85-1
> 
> #!/bin/bash
> 
> case $1 in
>      remove)
>          ip link del dev bridge0 || { echo "Please add first."; exit 1; }
>          ip link del dev veth1
>          ip link del dev veth2
>          #ip netns exec ns1 ip link del dev wg0
>          #ip netns exec ns2 ip link del dev wg0
>          ip netns del ns1
>          ip netns del ns2
>          iptables -D FORWARD -i bridge0 -o bridge0 -j ACCEPT
>          rm -f /tmp/private-ns1 /tmp/private-ns2 /tmp/public-ns1 
> /tmp/public-ns2
>      ;;
>      add)
>          ip link add name bridge0 type bridge || { echo "Please remove 
> first."; exit 1; }
>          ip link set dev bridge0 up
> 
>          ip netns add ns1
>          ip netns add ns2
>          ip link add name veth1 type veth peer name eth0 netns ns1
>          ip link add name veth2 type veth peer name eth0 netns ns2
>          ip link set dev veth1 up master bridge0
>          ip link set dev veth2 up master bridge0
> 
>          ip netns exec ns1 ip link set dev lo up
>          ip netns exec ns1 ip link set dev eth0 up
>          ip netns exec ns1 ip addr add 10.150.150.1/24 dev eth0
> 
>          ip netns exec ns2 ip link set dev lo up
>          ip netns exec ns2 ip link set dev eth0 up
>          ip netns exec ns2 ip addr add 10.150.150.2/24 dev eth0
> 
>          ( umask 0077;
>            wg genkey | \
>            tee /tmp/private-ns1 | \
>            wg pubkey > /tmp/public-ns1
> 
>            wg genkey | \
>            tee /tmp/private-ns2 | \
>            wg pubkey > /tmp/public-ns2
>          )
> 
>          ip netns exec ns1 ip link add name wg0 type wireguard
>          ip netns exec ns1 ip addr add 172.16.1.1/24 dev wg0
> 
>          ip netns exec ns2 ip link add name wg0 type wireguard
>          ip netns exec ns2 ip addr add 172.16.1.2/24 dev wg0
> 
>          ip netns exec ns1 wg set wg0 private-key /tmp/private-ns1 
> listen-port 51820
>          ip netns exec ns1 ip link set wg0 up
> 
>          ip netns exec ns2 wg set wg0 private-key /tmp/private-ns2 
> listen-port 51820
>          ip netns exec ns2 ip link set wg0 up
> 
>          ip netns exec ns1 wg set wg0 peer "$(</tmp/public-ns2)" allowed-ips 
> 172.16.1.0/24 endpoint 10.150.150.2:51820
>          ip netns exec ns2 wg set wg0 peer "$(</tmp/public-ns1)" allowed-ips 
> 172.16.1.0/24 endpoint 10.150.150.1:51820
> 
>          iptables -I FORWARD -i bridge0 -o bridge0 -j ACCEPT
> 
>          ip netns exec ns1 wg
>          ip netns exec ns2 wg
>          ip netns exec ns1 ping -i 0.3 -c 2 172.16.1.2 &>/dev/null && \
>                            echo -e "\n\nWorked" || \
>                            echo -e "\n\nFailed"
>      ;;
>      *)echo "$(basename $0) add|remove" ;;
> esac
> 
> 
