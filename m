Return-Path: <SRS0=dquF=GC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F0FC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Dec 2020 08:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4287B21BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Dec 2020 08:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4287B21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce28f437;
	Wed, 30 Dec 2020 08:09:27 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bbf28ac9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Dec 2020 08:09:24 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g20so21056938ejb.1
 for <wireguard@lists.zx2c4.com>; Wed, 30 Dec 2020 00:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=6HurXiG0I4U0Y7cl+jxX9vvIpfTkgs0oNLd0s4vEV8g=;
 b=CcoNaTDBWMEFmMANEiG+cs+HMdYxmvwnMCuoZrDP+xE9T16sIKMUEQR6wbugMyScmy
 s9DgVEBZGfvNFFiExhw6Iag8mINOvkq/qnsLo2VfdS7nE86rX7uLQyWgWVzAaDgAXRzi
 xF5K2tuTMV7nyFappGZAK8vw0aSqB1urjLRQ7BDHQdwGhhNwP743zYGYB8KL3+7uUK2x
 e4XNUXa1x2WtyG97X5efRbM2LvEiIbDL262qmSqLpuXFa/pTG42OKLtWnjRs0ViBIwcD
 qC0IHgNU6XID9SHUFJ1OW9hnPEafJwRMnDUMHGsXTahSsfBem3sHyOmtVO1+Iz4XIIb2
 X4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=6HurXiG0I4U0Y7cl+jxX9vvIpfTkgs0oNLd0s4vEV8g=;
 b=XYxcmrKEu/YNPBHQYOiZ5MHqall9+AAdwcgWsqeMh8qMYUlIyCxp28EHlZjcKu7Kly
 sGVd9pJIv+3NHrt0j52/2ik/GnL8PU8tk4VDQr7hTx+jYDcihPAse6g3voHEaDIEQt0R
 TGfHFqIMxG+J0+cy7DlD4bMVCiY0pa6DicjXhK6cKhBDuWFlyWcyE7VBMiu9zW1UDdvF
 r+NX7jjQ/yiDucV75kFHCQvHiKz9YwEppeoDVW081Ko/zmICie5Kp00p/pFQ+QU9IWke
 8LEpDAjoEg4GxUJYyUWMDQk2jXobl+HkpnKmQq117+6QJo+rgj0bAQzmaJNMrYDtIPjX
 i8DA==
X-Gm-Message-State: AOAM533HIP5KqI+WgI8ZRCDndkVmwalJlk9RS9VImYOOdc4FI1g1dI7O
 ksAbtCMsjM3bi7cSSCFmzJNN1NgbukQ=
X-Google-Smtp-Source: ABdhPJx6mupBHQaTd940Bx/RCotDoso7k0lsr/zIz2CAoukLPgeSx6dLXv53V8TzXx6LmvtPbZhLuQ==
X-Received: by 2002:a17:906:56ca:: with SMTP id
 an10mr48753386ejc.498.1609316372848; 
 Wed, 30 Dec 2020 00:19:32 -0800 (PST)
Received: from [10.34.12.4] ([81.215.239.150])
 by smtp.gmail.com with ESMTPSA id c16sm12964095ejk.91.2020.12.30.00.19.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 00:19:32 -0800 (PST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Fatih USTA <fatihusta86@gmail.com>
Subject: wg-crypt-wg0 process
Message-ID: <d56b4194-2b74-b440-c102-3b379daa8194@gmail.com>
Date: Wed, 30 Dec 2020 11:19:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi

I'm playing wireguard with the namespace. I think I caught a litle problem.

If I delete netns directly, everything is removed, but wg-crypt-wg0 
process is still alive.

root      8127  0.0  0.0      0     0 ?        S<   07:26 0:00 
[wg-crypt-wg0]
root      8143  0.0  0.0      0     0 ?        S<   07:26 0:00 
[wg-crypt-wg0]
root      8449  0.0  0.0      0     0 ?        S<   07:26 0:00 
[wg-crypt-wg0]
root      8454  0.0  0.0      0     0 ?        S<   07:26 0:00 
[wg-crypt-wg0]

If I delete first wireguard interface from the netns, everthing works fine.

wg_version:        1.0.20201221
kernel_version:       3.16.85-1

#!/bin/bash

case $1 in
     remove)
         ip link del dev bridge0 || { echo "Please add first."; exit 1; }
         ip link del dev veth1
         ip link del dev veth2
         #ip netns exec ns1 ip link del dev wg0
         #ip netns exec ns2 ip link del dev wg0
         ip netns del ns1
         ip netns del ns2
         iptables -D FORWARD -i bridge0 -o bridge0 -j ACCEPT
         rm -f /tmp/private-ns1 /tmp/private-ns2 /tmp/public-ns1 
/tmp/public-ns2
     ;;
     add)
         ip link add name bridge0 type bridge || { echo "Please remove 
first."; exit 1; }
         ip link set dev bridge0 up

         ip netns add ns1
         ip netns add ns2
         ip link add name veth1 type veth peer name eth0 netns ns1
         ip link add name veth2 type veth peer name eth0 netns ns2
         ip link set dev veth1 up master bridge0
         ip link set dev veth2 up master bridge0

         ip netns exec ns1 ip link set dev lo up
         ip netns exec ns1 ip link set dev eth0 up
         ip netns exec ns1 ip addr add 10.150.150.1/24 dev eth0

         ip netns exec ns2 ip link set dev lo up
         ip netns exec ns2 ip link set dev eth0 up
         ip netns exec ns2 ip addr add 10.150.150.2/24 dev eth0

         ( umask 0077;
           wg genkey | \
           tee /tmp/private-ns1 | \
           wg pubkey > /tmp/public-ns1

           wg genkey | \
           tee /tmp/private-ns2 | \
           wg pubkey > /tmp/public-ns2
         )

         ip netns exec ns1 ip link add name wg0 type wireguard
         ip netns exec ns1 ip addr add 172.16.1.1/24 dev wg0

         ip netns exec ns2 ip link add name wg0 type wireguard
         ip netns exec ns2 ip addr add 172.16.1.2/24 dev wg0

         ip netns exec ns1 wg set wg0 private-key /tmp/private-ns1 
listen-port 51820
         ip netns exec ns1 ip link set wg0 up

         ip netns exec ns2 wg set wg0 private-key /tmp/private-ns2 
listen-port 51820
         ip netns exec ns2 ip link set wg0 up

         ip netns exec ns1 wg set wg0 peer "$(</tmp/public-ns2)" 
allowed-ips 172.16.1.0/24 endpoint 10.150.150.2:51820
         ip netns exec ns2 wg set wg0 peer "$(</tmp/public-ns1)" 
allowed-ips 172.16.1.0/24 endpoint 10.150.150.1:51820

         iptables -I FORWARD -i bridge0 -o bridge0 -j ACCEPT

         ip netns exec ns1 wg
         ip netns exec ns2 wg
         ip netns exec ns1 ping -i 0.3 -c 2 172.16.1.2 &>/dev/null && \
                           echo -e "\n\nWorked" || \
                           echo -e "\n\nFailed"
     ;;
     *)echo "$(basename $0) add|remove" ;;
esac


-- 
Fatih USTA

