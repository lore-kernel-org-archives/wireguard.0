Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB0C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A3B20674
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A3B20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45620c1e;
	Wed, 27 Nov 2019 09:05:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e221ea19
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Nov 2019 22:40:59 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d3133a1
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Nov 2019 22:40:58 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id r27so2849614otc.8
 for <wireguard@lists.zx2c4.com>; Tue, 26 Nov 2019 14:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=NAo5VVa5WXlpp/tlsT6sDVsUT07Caxta3dgd5fQjGGw=;
 b=o+0PTJmur2f35V97RCxegQBkajVmw5O5FW8jkkIiflJiNcE8rPXaKzyWt0lU3FKfP8
 3un/NoeaL2PeMlGDtEzMH/Vzn915O0lkFVGPIwdynLn0x0QWgew8EXMGDrN8yJynEWUS
 MqRfMALy1Ao8v/CLYcdLJq/WWqTBtXIWV2+kUzwjq85A3omQq22u4chEGEwMKgSeWiww
 YWl0P9ur6nncDm1YymIPgg9V6NZW6nXe/0eort3278rBeo9mO6J/4es98/fI8qoNp6U8
 jpgo26Q2B8U7rLsju6JxTPmmjBlw4ab3OiC8uQnYkze4Y8W6SJ1ByfLNlkmEfhjsyyBi
 pq8g==
X-Gm-Message-State: APjAAAWpGo9MFVEDq0B5GZIFLYJWAEhXyn/Wf1BgO657aoHkxyyyppyS
 g65g7SRSqqW9j9b67ahSpPZvi4EP
X-Google-Smtp-Source: APXvYqzit9oGdVQ4HkRjOE3wNwFSIy41U3FU4V8jz3L5P3DJKBwJLtopbwjYCij9k60uOVlLzLsHDw==
X-Received: by 2002:a05:6830:1149:: with SMTP id
 x9mr1050056otq.47.1574808058146; 
 Tue, 26 Nov 2019 14:40:58 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com.
 [209.85.210.52])
 by smtp.gmail.com with ESMTPSA id 103sm4171456otn.63.2019.11.26.14.40.57
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 14:40:57 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id w24so17441339otk.6
 for <wireguard@lists.zx2c4.com>; Tue, 26 Nov 2019 14:40:57 -0800 (PST)
X-Received: by 2002:a9d:549:: with SMTP id 67mr676916otw.175.1574808057691;
 Tue, 26 Nov 2019 14:40:57 -0800 (PST)
MIME-Version: 1.0
From: Conrad Meyer <cem@freebsd.org>
Date: Tue, 26 Nov 2019 14:40:47 -0800
X-Gmail-Original-Message-ID: <CAG6CVpU7L67oBqM5vi7-oXfYN=jMF9urvfxz_qZqFjdm-a+F=A@mail.gmail.com>
Message-ID: <CAG6CVpU7L67oBqM5vi7-oXfYN=jMF9urvfxz_qZqFjdm-a+F=A@mail.gmail.com>
Subject: Bug in helper contrib/examples/reresolve-dns/reresolve-dns.sh
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:05:45 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: cem@freebsd.org
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

Hi,

reresolve-dns.sh seems to have a bug where interfaces with more than a
single peer configured do not match the output of "latest-handshakes"
correctly.  Chiefly, the ^ and $ regex anchors in the script match on
the full, multiline output of 'wg foo latest-handshakes' in bash,
rather than matching on individual lines (which is clearly the
intent).

This is observed on both bash 4.4.23 and 5.0.11.

The easiest fix to this problem is simply to remove the anchors.
There should be no issue with false positive matching, nor correctly
parsing the last handshake time.  With this minor change,
reresolve-dns.sh actually functions on my host with two peers
configured.

I did not spot any obvious way to change bash's regex line-matching
behavior.  If that exists, it may be preferable.

Thank you,
Conrad
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
