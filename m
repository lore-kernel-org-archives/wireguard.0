Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5CEC38A24
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58C86206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=samipsolutions.fi header.i=@samipsolutions.fi header.b="oEkIpyrI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58C86206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=samipsolutions.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3837841f;
	Wed, 6 May 2020 10:35:19 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8656c8f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Apr 2020 09:07:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id t11so1042319lfe.4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Apr 2020 02:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samipsolutions.fi; s=google;
 h=from:to:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=1bJRMSc+8WvG5C3+Z1+WL3x05XssvJLe+s7brEc4kmw=;
 b=oEkIpyrIpH8sjklufkPXGcLP2Dp30lbngCpsf9VPQOnbEF9kEthSdcV5sMjVrBO8Q5
 Z/YouGIuNok2kIyCbwsUGeAxqCXAUfACbjuYrQ6GSZp0X8Ts6t2QzLZNgWy4PspbzIMF
 chELy79Q4jvS8i539KBnjnWR9wChgxwl1ZthzAz0thm8wA1PPOs1XX4WP0d+ujll0RT8
 4liyPlaFwLspSwcnGz7kp/BDCl430/RJPw8ygVPbujymTa0efGaHOXcHmHwCHW35pcwT
 NssFaXGXrgwu91CTcQoEaL+OCOQsa607sQKubZBvdqal6zxGu7FeUqCGLWrgmK4oEPaI
 D0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=1bJRMSc+8WvG5C3+Z1+WL3x05XssvJLe+s7brEc4kmw=;
 b=dqgOUw1bkVWj7q8YRsAYyJAHh6NMbIF6FBZjvg1zh179wZmq2VWC6dgzQvPZpI+W1i
 1TWT74kKVBsjCc3uSyvJGNcPU5w5DCM1LKUz5wK0zJTAhtO8Rg0f1ucdU2vVn0S/7OZI
 nMNaWjpByBfEkymm9MeTlHWr+Zsdwgoo3aaObsvb/2qm/jgIdT54ckud1CGPKwVS9qyF
 1AFROTYfU9yBiSP+EHyCOAJoAcQZ8gtCtGMiyla2pwSOPk5R0JHFQF/cUNwNRjW1gcMi
 NmUFRm4D6xAePoOKIH94eJJoUcisl5zAVveL7CwQX65JYvodzuV3nX5XpeeNmYDWxyMG
 dpQg==
X-Gm-Message-State: AGi0Pua6UdY8xbjDE6fjPF2xy6nndo4Tpc6AnkohUJJDCIYUxPBqvhCY
 GbnjC/KMrg1NnT8TP+0PWqYnVPDumxPZ0gKO
X-Google-Smtp-Source: APiQypI/nCJ+VcixIM7PSQRPkWyfq7ZG+oHHU6DhTWjP4m/T8xnlBAinTailK1uXUqGkHdALjwA8SQ==
X-Received: by 2002:a19:c750:: with SMTP id x77mr22252425lff.1.1588151955906; 
 Wed, 29 Apr 2020 02:19:15 -0700 (PDT)
Received: from Skylers-MBP.home.samip.fi
 ([2a01:4f9:2b:f80a:9997:777:2663:f745])
 by smtp.gmail.com with ESMTPSA id g3sm2064774ljk.27.2020.04.29.02.19.15
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 02:19:15 -0700 (PDT)
From: "=?UTF-8?Q?Skyler_M=c3=a4ntysaari?="
 <skyler.mantysaari@samipsolutions.fi>
X-Google-Original-From: =?UTF-8?Q?Skyler_M=c3=a4ntysaari?= <sm+lists@samip.fi>
To: wireguard@lists.zx2c4.com
Subject: Split tunneling with VyOS and Mac client
Message-ID: <c74e7d0a-f902-c872-4aed-7ab71f2aa1de@samip.fi>
Date: Wed, 29 Apr 2020 12:19:14 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 06 May 2020 12:35:17 +0200
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

Dear list subscribers,

I have tried to find actual documentation on split tunneling with 
Wireguard, but couldn't find really any actual examples on it. IPv6 
works, but my IPv4 connection does not work after connecting the VPN and 
I only want IPv6 to be tunneled. IPv4 should use the non-vpn gateway.

Pinging for example Cloudflare's DNS does not work, I get timeouts.
This is to give myself IPv6 connectivity when the actual network lacks it.

Server config:
  address 2a01:xxx:xx:f80b::1/64
  address 192.168.99.1/24
  peer sky-mbp {
      allowed-ips 2a01:xxx:xx:f80b:bad:c0de::1/128
      allowed-ips 192.168.99.3/32
      persistent-keepalive 15
      pubkey <censored>
  }
  port 51820

Client config:
[Interface]
PrivateKey = <censored>
Address = 192.168.99.3/32, 2a01:xxx:xx:f80b:bad:c0de:0:1/128
DNS = 2a01:xxx:xx:f80b::1

[Peer]
PublicKey = <censored>
AllowedIPs = 192.168.99.1/32, ::0/0
Endpoint = server_ipv4_address_censored:51820
PersistentKeepalive = 15


Best regards,
Skyler M

