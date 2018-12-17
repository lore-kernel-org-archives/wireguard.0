Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E653C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:50:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9732084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X3PmF1+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9732084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45f40482;
	Mon, 17 Dec 2018 08:50:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bbdce3b
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:50:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ca0a43d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:50:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f4e8394
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lEQtgDefkDP+oNckfAz4Cv7lwWA=; b=X3PmF1
 +yVTQLSGBxYxkxdnc4U7AJPCBpsrJNBLJVmWfs3SY09CYTd8GrYHaLeDLDv1OpKm
 5mLzm7N4k2et9Hfpb4YrPxpOp9WPyp1qidLeApm0M/X8TimbyHo9J1GrxQUSK+Gf
 7U87/hCNiwdOeBFLuQ1WWcAoBN89E3eS1wDCNXlElycLa+08GnPbMB+nHT5+OReo
 qJ8Knj6cWH3KNKGN+hp17NivgufYM8b47dIeWRXQ1yXnb2KIGD+Dpthx3cK0vmo9
 S3de7E71xkoXc8qz5fv8cUmDEY1IzjEq3d5rld/T8+bX1TUXbtd20ab21GLtEdi+
 GVJQgAexoy8CJc7Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 156f75e3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:41:08 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id s5so11420236oth.7
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 00:50:40 -0800 (PST)
X-Gm-Message-State: AA+aEWYuUei/XyZGiVW69gU5M7jazzqRZOgU9hbPIMUR67hqooFr0EBj
 ijtQ9knCw+q/BzPioM8nFZr6GDFotJb9m2AZC/c=
X-Google-Smtp-Source: AFSGD/VN9Agz7rCS4t2S6tBlOBrtpyIbRN8iTKYePx5awuXOboVUW7LyHejHw++9O0frqdRRv5XBCbe3mfSF8opIt4A=
X-Received: by 2002:a9d:14e:: with SMTP id 72mr9394022otu.54.1545036640063;
 Mon, 17 Dec 2018 00:50:40 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
 <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
 <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
In-Reply-To: <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Dec 2018 09:50:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9qc=R5nT-KTyi6JZ_oZFPXk8k9cjTJgu-HWDZo9hniObA@mail.gmail.com>
Message-ID: <CAHmME9qc=R5nT-KTyi6JZ_oZFPXk8k9cjTJgu-HWDZo9hniObA@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Dec 17, 2018 at 9:10 AM KeXianbin(http://diyism.com)
<kexianbin@diyism.com> wrote:
>
> It seems that "AllowedIPs" have nothing to do with refusing unwantted peer's IP.
> It only specifes the outgoing target IPs,

It should also refuse unwanted, as you wrote. From src/tests/netns.sh,
we have this section:

n1 wg set wg0 peer "$pub2" allowed-ips 192.168.241.0/24
exec 4< <(n1 ncat -l -u -p 1111)
ncat_pid=$!
waitncatudp $netns1
n2 ncat -u 192.168.241.1 1111 <<<"X"
read -r -N 1 -t 1 out <&4 && [[ $out == "X" ]]
kill $ncat_pid
more_specific_key="$(pp wg genkey | pp wg pubkey)"
n1 wg set wg0 peer "$more_specific_key" allowed-ips 192.168.241.2/32
n2 wg set wg0 listen-port 9997
exec 4< <(n1 ncat -l -u -p 1111)
ncat_pid=$!
waitncatudp $netns1
n2 ncat -u 192.168.241.1 1111 <<<"X"
! read -r -N 1 -t 1 out <&4 || false
kill $ncat_pid
n1 wg set wg0 peer "$more_specific_key" remove
[[ $(n1 wg show wg0 endpoints) == "$pub2        [::1]:9997" ]]

Would you propose a more specific test to reach the case you're experiencing?

I also tried to reproduce your situation manually between two real
computers without success:

cannonball ~ # ip link add wg0 type wireguard
cannonball ~ # wg set wg0 private-key <(wg genkey)

thinkpad ~ # ip link add wg0 type wireguard
thinkpad ~ # wg set wg0 private-key <(wg genkey) listen-port 51820
peer fFLm5F2YxzkH0IB1p+r6NUwNqKw3sp09NtVdoWO1lHA= allowed-ips
10.1.0.3/32

cannonball ~ # wg set wg0 peer
YKuR7SRtK4YsF//lqFNp4dSOYdAa6VTNvKFulgC0Vy4= allowed-ips 0.0.0.0/0
endpoint 10.10.13.100:51820

thinkpad ~ # ip address add 10.1.0.1/24 dev wg0
thinkpad ~ # ip link set up dev wg0

cannonball ~ # ip address add 10.1.0.3/24 dev wg0
cannonball ~ # ip link set up dev wg0

cannonball ~ # ping -q -c 1 10.1.0.1
PING 10.1.0.1 (10.1.0.1) 56(84) bytes of data.

--- 10.1.0.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 3.492/3.492/3.492/0.000 ms

cannonball ~ # ip address flush dev wg0
cannonball ~ # ip address add 10.1.0.4/24 dev wg0
cannonball ~ # ping -q -c 1 10.1.0.1
PING 10.1.0.1 (10.1.0.1) 56(84) bytes of data.

--- 10.1.0.1 ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 0ms

thinkpad ~ # dmesg | grep unallowed
[17084.651723] wireguard: wg0: Packet has unallowed src IP (10.1.0.4)
from peer 1 (10.10.13.108:47686)

Therefore, I'm seeing the expected behavior. Can you show a similar
sequence that demonstrates the bug you're reporting?

Thanks,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
