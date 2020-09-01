Return-Path: <SRS0=SKLp=CK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE1E4C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Sep 2020 08:30:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2163A206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Sep 2020 08:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZii90zJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2163A206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ef47d7b;
	Tue, 1 Sep 2020 08:02:24 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d98e230c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Sep 2020 08:02:21 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w5so494016wrp.8
 for <wireguard@lists.zx2c4.com>; Tue, 01 Sep 2020 01:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mO1sIwTY4xCJ7UT1SKTSxk9sS8G3HzP1ulUEz5VJbpY=;
 b=jZii90zJoykBHkNI9xkPCNbR+3hJogkYYq+3cXEIOBY91IhIJUIHjrARMMXHFo87l9
 BKzXJyaqjAZNqIB3SXVSHnn0j+tW7F74T8lPvVqJN0kDHulkb6UXo3xCRTlp4tM6oQRg
 q8DOueV8fazenugckbyxBaXLf76YFNQZGVYraUCfj3DE5P+128hxX9PKxKMveGl2uI2W
 Ea22HBmZdheQnjDYdhMe59XegsS2LM9uoFbk1aJXxZCooERkEqPBa3WpkmAoKRDpr1lv
 HZHPwBPfY7PxRchjQYOtioYiCpd2RMXHpL5U/b/s4lebI+SyH1lIoLuUy5pa08WknaJy
 Hvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mO1sIwTY4xCJ7UT1SKTSxk9sS8G3HzP1ulUEz5VJbpY=;
 b=ZppPCyMSmJSJNpEm67XaUUp/0z58Yugqba4R1Bt1X4tJy1ML6SKgVlGc5faTefGxld
 nmakSoF4QdIBG9tWH2ykXB8zf5u5pf/RvqbBf+aGIrWH8WR4i/q6EUe+YtgDijqIPNwk
 GRr4vhSS13XmMOvzLIsVsarGnmA//Mi4Ui4eKygIUsY7y9D+IhHy6q9dZJW079IonMyK
 duEp8N7SayMQJKm+ZM8BLFjArQEGz/V8KYCXRG9P+he1Mkjs96xJc7T2tvKiHAMwA3CJ
 4GL5I+o6TQAXzNkxoFZ2JMS3A3PIydfp82LhyoXbXT+QFJJCAauWdhhSK6Kb51elxeuZ
 9jTw==
X-Gm-Message-State: AOAM532WetGdf1GueZ+GIG8j3h8qw3ddCIcwOXaBDhhrQd3eJCYzROR5
 SUiY/JjWAtN2F+oHe5f4lnV3rbjkKAne4w==
X-Google-Smtp-Source: ABdhPJzBl6R8QRqQ4GABuV3Sa3qmX7Tqnbsn5c73k7+nWVSUPpSI8cITz7RZ4oVct0kjT7bjuElh8w==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr611747wrr.406.1598949017353; 
 Tue, 01 Sep 2020 01:30:17 -0700 (PDT)
Received: from [192.168.25.202] ([2.25.87.76])
 by smtp.gmail.com with ESMTPSA id a83sm767095wmh.48.2020.09.01.01.30.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 01:30:16 -0700 (PDT)
Subject: Re: Problems with Windows client
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
 <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <b556392b-fb2c-7a40-e6a9-c36610237fd6@gmail.com>
Date: Tue, 1 Sep 2020 09:30:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

Here are the config file and log file while attempting to connect. The 
network and routes are correct as the identical configuration works with 
no issues in the TunSafe client 1.5-rc2. However, of course I would 
prefer to use the real client!

Regards

Peter

=====================

Below is the config file (redacted)

[Interface]
PrivateKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
Address = 10.2.80.226/32

[Peer]
PublicKey = QfjlPwEQa03gx7OYkM3Al8MIrfTx7WY0TT235eg0V1w=
PresharedKey = yorTvlJ8aiAmhxd1KpLWeC+MTLsC25EHNKAPi0YtP8A=
AllowedIPs = 10.2.80.0/25, 10.12.0.0/23, 10.2.0.34/31, 10.2.2.34/31, 
10.2.4.34/31, 10.2.6.34/31
Endpoint = iris-fw1.XXXXXX.com:21820
PersistentKeepalive = 25

=====================

And here are the logs:

2020-09-01 09:18:43.349190: [MGR] Starting WireGuard/0.1.1 (Windows 
10.0.18362; amd64)
2020-09-01 09:18:43.360141: [MGR] Starting UI process for user 
‘whiskerp@XXXXXX’ for session 1
2020-09-01 09:20:17.731706: [TUN] [lhirisseccom01] Starting 
WireGuard/0.1.1 (Windows 10.0.18362; amd64)
2020-09-01 09:20:17.734729: [TUN] [lhirisseccom01] Watching network 
interfaces
2020-09-01 09:20:17.738681: [TUN] [lhirisseccom01] Resolving DNS names
2020-09-01 09:20:17.797513: [TUN] [lhirisseccom01] Creating Wintun interface
2020-09-01 09:20:19.431220: [TUN] [lhirisseccom01] Using Wintun/0.8 
(NDIS 6.83)
2020-09-01 09:20:19.778181: [TUN] [lhirisseccom01] Enabling firewall rules
2020-09-01 09:20:20.213362: [TUN] [lhirisseccom01] Dropping privileges
2020-09-01 09:20:20.287150: [TUN] [lhirisseccom01] Creating interface 
instance
2020-09-01 09:20:20.336012: [TUN] [lhirisseccom01] Routine: event worker 
- started
2020-09-01 09:20:20.371912: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.443225: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.479123: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.495077: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.510035: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.512029: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.513026: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.513026: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.517019: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.520011: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.521004: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.521004: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.521004: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.521004: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-01 09:20:20.522000: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.522998: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.522998: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-01 09:20:20.522998: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-01 09:20:20.522998: [TUN] [lhirisseccom01] Routine: TUN reader - 
started
2020-09-01 09:20:20.522998: [TUN] [lhirisseccom01] Setting interface 
configuration
2020-09-01 09:20:20.523995: [TUN] [lhirisseccom01] UAPI: Updating 
private key
2020-09-01 09:20:20.524993: [TUN] [lhirisseccom01] UAPI: Removing all peers
2020-09-01 09:20:20.524993: [TUN] [lhirisseccom01] UAPI: Transition to 
peer configuration
2020-09-01 09:20:20.525990: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Created
2020-09-01 09:20:20.526989: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating preshared key
2020-09-01 09:20:20.527984: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating endpoint
2020-09-01 09:20:20.527984: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating persistent keepalive interval
2020-09-01 09:20:20.528981: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Removing all allowedips
2020-09-01 09:20:20.528981: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.528981: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.528981: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.528981: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.529979: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.529979: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-01 09:20:20.529979: [TUN] [lhirisseccom01] Bringing peers up
2020-09-01 09:20:20.533973: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv6 - started
2020-09-01 09:20:20.536959: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv4 - started
2020-09-01 09:20:20.536959: [TUN] [lhirisseccom01] UDP bind has been updated
2020-09-01 09:20:20.536959: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Starting...
2020-09-01 09:20:20.536959: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: nonce worker - started
2020-09-01 09:20:20.536959: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - started
2020-09-01 09:20:20.538381: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - started
2020-09-01 09:20:20.538381: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending keepalive packet
2020-09-01 09:20:20.539366: [TUN] [lhirisseccom01] Monitoring default v6 
routes
2020-09-01 09:20:20.539366: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-01 09:20:20.539366: [TUN] [lhirisseccom01] Binding v6 socket to 
interface 0 (blackhole=false)
2020-09-01 09:20:20.539366: [TUN] [lhirisseccom01] Setting device v6 
addresses
2020-09-01 09:20:20.542356: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Awaiting keypair
2020-09-01 09:20:20.624124: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake response
2020-09-01 09:20:20.722117: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Obtained awaited keypair
2020-09-01 09:20:21.361710: [TUN] [lhirisseccom01] Monitoring default v4 
routes
2020-09-01 09:20:21.373676: [TUN] [lhirisseccom01] Binding v4 socket to 
interface 22 (blackhole=false)
2020-09-01 09:20:21.374673: [TUN] [lhirisseccom01] Setting device v4 
addresses
2020-09-01 09:20:21.445471: [TUN] [lhirisseccom01] Listening for UAPI 
requests
2020-09-01 09:20:21.452451: [TUN] [lhirisseccom01] Startup complete
2020-09-01 09:20:21.461427: [TUN] [lhirisseccom01] Unable to set 
interface addresses, routes, dns, and/or interface settings: The object 
already exists.
2020-09-01 09:20:22.090177: [TUN] [lhirisseccom01] Device closing
2020-09-01 09:20:22.103143: [TUN] [lhirisseccom01] Routine: TUN reader - 
stopped
2020-09-01 09:20:22.503552: [TUN] [lhirisseccom01] Routine: event worker 
- stopped
2020-09-01 09:20:22.511530: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv4 - stopped
2020-09-01 09:20:22.526487: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv6 - stopped
2020-09-01 09:20:22.584831: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Stopping...
2020-09-01 09:20:22.588818: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - stopped
2020-09-01 09:20:22.588818: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.588818: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.589820: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.589820: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.591812: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.592806: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.592806: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.593805: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.594801: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.595798: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.595798: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.595798: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.598790: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.599787: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.599787: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.599787: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.599787: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-01 09:20:22.601782: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-01 09:20:22.603775: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-01 09:20:22.606767: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - stopped
2020-09-01 09:20:22.607765: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: nonce worker - stopped
2020-09-01 09:20:22.612750: [TUN] [lhirisseccom01] Interface closed
2020-09-01 09:20:22.621725: [TUN] [lhirisseccom01] Shutting down

