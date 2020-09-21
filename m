Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8C4C43464
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 10:39:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFFA20EDD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 10:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgYATcNR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFFA20EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53cca6dd;
	Mon, 21 Sep 2020 10:08:48 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 790f3580
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 10:08:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w5so12177760wrp.8
 for <wireguard@lists.zx2c4.com>; Mon, 21 Sep 2020 03:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Eu6YzrzbYHlCn3OjYe9/cldDkjZdCI5D64HdrpQpCEU=;
 b=sgYATcNRt3ud0SqLNDrUoktBLCbR3Qo4RI+WILfd/7YA/heMdS/vCAQal+hYrWojfe
 IRAajMLV66sNhqxbbbwfS4qf+jIMhscn5NgtlzE7u+IGmPiesgjq7S70qX96GDukyvLT
 WjGVsao8N+dmMF66b/32OY7taoAcOqb056hBnGfmQMII/Fr5Ye6L6WrWfSyY42daB2RX
 hcu1Xvv1gZ4dzTEPgThuR5fNf+zw+uN3lWW9Qui4NpWXr0APrRUUqYJ8kMrHJBxdmzCn
 dl9vGWQpj94YQdIPn2OZ2waoK7yLlroF5ZsDy1P7ptOvuCVErJiJWE2X6V6rAb53PID7
 FlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Eu6YzrzbYHlCn3OjYe9/cldDkjZdCI5D64HdrpQpCEU=;
 b=ZihbRngrfQ2tKRFR4GYvBHDax2eVH35v7N80hSaLkBNCftj4l0UJBAFjLWfvFpxx4D
 Bqi7UpxFb5ycO8jKZo1CNomoSyqUlXhaNPGjsQJRxhOW0XqU7ghExMTZzlpC7TUTFdCc
 75YF5XZX+FQooDfQSV/rp3QL/B2cDG+eIzjkP40UUxLuxmynvA5M8DNTOed2WBBpREbD
 thuE2F5ZlTg00ouo3D8hZuhIN9e6WkqHeDVN1nhg2ksVV6ITOlkhq+dK2E2D6qF0Qixv
 bkBfK0YmjhR1eJ3hrsv6U0Qgk+al9q+IVcfYu4teZe0P3962UqToMppSYt41b37hTR3S
 gg7g==
X-Gm-Message-State: AOAM532S9/7iqf0AERujldW39czD4lZ04MJpTsrODwnBghlqhEWE4lpM
 +JN2LWuFYP/S08pSI4vcEMooqSeSa8EN6w==
X-Google-Smtp-Source: ABdhPJxj3maNZZ3o1jndhiI38LnF49rc5Mmch7lQNahDLJ1AiLueo/rNgtIzLnbgeaZ3nmR6WjQ1xA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr52872329wrp.413.1600684757310; 
 Mon, 21 Sep 2020 03:39:17 -0700 (PDT)
Received: from [192.168.25.203] ([2.25.87.76])
 by smtp.gmail.com with ESMTPSA id s67sm19190211wmf.38.2020.09.21.03.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:39:16 -0700 (PDT)
Subject: Re: Problems with Windows client
To: Simon Rozman <simon@rozman.si>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
 <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
 <b556392b-fb2c-7a40-e6a9-c36610237fd6@gmail.com>
 <74df5880ee38427a86019f7a36788a34@rozman.si>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <2718d8de-42a1-00dc-2932-a4d253d33423@gmail.com>
Date: Mon, 21 Sep 2020 11:39:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <74df5880ee38427a86019f7a36788a34@rozman.si>
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

Hi Simon

Ah, OK, that was one issue. I fixed that by disabling the TUN-Windows6 
interface. Wireguard happily connects to an external site I have, but 
still there is an issue to the one via the Pulse tunnel.

The tunnel claims to come up, routes are added correctly but the 
handshakes don't seem very stable and traffic doesn't flow.

2020-09-14 08:37:43.411496: [MGR] Starting WireGuard/0.1.1 (Windows 
10.0.18362; amd64)
2020-09-14 08:37:43.422394: [MGR] Starting UI process for user 
‘whiskerp@GROUPINFRA’ for session 1
2020-09-14 08:37:46.079843: [TUN] [lhirisseccom01] Starting 
WireGuard/0.1.1 (Windows 10.0.18362; amd64)
2020-09-14 08:37:46.080833: [TUN] [lhirisseccom01] Watching network 
interfaces
2020-09-14 08:37:46.085786: [TUN] [lhirisseccom01] Resolving DNS names
2020-09-14 08:37:46.152152: [TUN] [lhirisseccom01] Creating Wintun interface
2020-09-14 08:37:48.451529: [TUN] [lhirisseccom01] Using Wintun/0.8 
(NDIS 6.83)
2020-09-14 08:37:48.490161: [TUN] [lhirisseccom01] Enabling firewall rules
2020-09-14 08:37:48.837582: [TUN] [lhirisseccom01] Dropping privileges
2020-09-14 08:37:48.913732: [TUN] [lhirisseccom01] Creating interface 
instance
2020-09-14 08:37:48.985102: [TUN] [lhirisseccom01] Routine: event worker 
- started
2020-09-14 08:37:49.029493: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.046333: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.058219: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.071096: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.079015: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.081985: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.114673: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.126560: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.128541: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.133494: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.139437: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.142408: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.144390: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.148352: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.153305: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.170144: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.174107: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.177078: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.180269: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.182171: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-09-14 08:37:49.182171: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.182171: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.183161: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-09-14 08:37:49.183161: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-09-14 08:37:49.183161: [TUN] [lhirisseccom01] Routine: TUN reader - 
started
2020-09-14 08:37:49.184151: [TUN] [lhirisseccom01] Setting interface 
configuration
2020-09-14 08:37:49.185142: [TUN] [lhirisseccom01] UAPI: Updating 
private key
2020-09-14 08:37:49.186132: [TUN] [lhirisseccom01] UAPI: Removing all peers
2020-09-14 08:37:49.186132: [TUN] [lhirisseccom01] UAPI: Transition to 
peer configuration
2020-09-14 08:37:49.187123: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Created
2020-09-14 08:37:49.187123: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating preshared key
2020-09-14 08:37:49.187123: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating endpoint
2020-09-14 08:37:49.187123: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating persistent keepalive interval
2020-09-14 08:37:49.188113: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Removing all allowedips
2020-09-14 08:37:49.188113: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.188113: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.188113: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.189104: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.189104: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.189104: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-09-14 08:37:49.189104: [TUN] [lhirisseccom01] Bringing peers up
2020-09-14 08:37:49.190095: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv6 - started
2020-09-14 08:37:49.192076: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv4 - started
2020-09-14 08:37:49.192076: [TUN] [lhirisseccom01] UDP bind has been updated
2020-09-14 08:37:49.193067: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Starting...
2020-09-14 08:37:49.193067: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - started
2020-09-14 08:37:49.194057: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: nonce worker - started
2020-09-14 08:37:49.194057: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - started
2020-09-14 08:37:49.195049: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending keepalive packet
2020-09-14 08:37:49.195049: [TUN] [lhirisseccom01] Monitoring default v4 
routes
2020-09-14 08:37:49.195049: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:37:49.200000: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Awaiting keypair
2020-09-14 08:37:49.200991: [TUN] [lhirisseccom01] Binding v4 socket to 
interface 22 (blackhole=false)
2020-09-14 08:37:49.201981: [TUN] [lhirisseccom01] Setting device v4 
addresses
2020-09-14 08:37:49.251208: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake response
2020-09-14 08:37:49.266067: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Obtained awaited keypair
2020-09-14 08:37:51.847336: [TUN] [lhirisseccom01] Monitoring default v6 
routes
2020-09-14 08:37:51.849315: [TUN] [lhirisseccom01] Binding v6 socket to 
interface 0 (blackhole=false)
2020-09-14 08:37:51.850307: [TUN] [lhirisseccom01] Setting device v6 
addresses
2020-09-14 08:37:53.848495: [TUN] [lhirisseccom01] Listening for UAPI 
requests
2020-09-14 08:37:53.863023: [TUN] [lhirisseccom01] Startup complete
2020-09-14 08:37:54.276293: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:37:54.277285: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:37:59.648263: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:37:59.648263: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:04.738217: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:04.738217: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:10.092874: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:10.092874: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:15.454052: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:15.454052: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:20.556130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:20.556130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:25.658524: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:25.658524: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:31.016112: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:38:31.016112: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:38:47.270325: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Retrying handshake because we stopped hearing back after 15 seconds
2020-09-14 08:38:47.270325: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:38:52.543592: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:38:52.543592: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:38:57.617018: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 3)
2020-09-14 08:38:57.617018: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:39:02.710943: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 4)
2020-09-14 08:39:02.710943: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:39:05.329483: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Retrying handshake because we stopped hearing back after 15 seconds
2020-09-14 08:39:07.775887: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:39:07.775887: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:39:12.852980: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 3)
2020-09-14 08:39:12.855162: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:39:17.944130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 4)
2020-09-14 08:39:17.944130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:39:22.810801: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:22.810801: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:23.010247: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 5)
2020-09-14 08:39:28.165288: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:28.165288: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:33.520656: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:33.520656: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:38.884012: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:38.886998: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:44.246649: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:44.246649: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:49.594974: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:49.594974: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:39:54.952930: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:39:54.953924: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:00.054531: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:00.055525: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:05.363407: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:05.415486: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:05.416512: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:10.421407: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:10.422402: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:10.515798: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:10.516796: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:15.679493: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:15.679581: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:15.872032: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:15.872032: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:20.760460: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:20.975553: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:20.975553: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:26.267953: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:26.325259: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:26.335169: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:31.424640: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:31.424640: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:31.690144: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:31.690144: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:36.560198: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:36.793135: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:36.793135: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:41.896736: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:41.896736: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:47.224830: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:47.253511: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:47.253511: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:50.180877: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Awaiting keypair
2020-09-14 08:40:52.277130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:52.277130: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-09-14 08:40:52.612274: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:52.612274: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:40:57.322421: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-09-14 08:40:57.968623: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:40:57.968623: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:41:00.825600: [MGR] [lhirisseccom01] Tunnel service 
tracker finished
2020-09-14 08:41:02.363492: [TUN] [lhirisseccom01] Device closing
2020-09-14 08:41:02.363492: [TUN] [lhirisseccom01] Routine: TUN reader - 
stopped
2020-09-14 08:41:03.331908: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake initiation
2020-09-14 08:41:03.335884: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake response
2020-09-14 08:41:03.774915: [TUN] [lhirisseccom01] Routine: event worker 
- stopped
2020-09-14 08:41:03.803827: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv4 - stopped
2020-09-14 08:41:03.810784: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv6 - stopped
2020-09-14 08:41:03.818736: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Stopping...
2020-09-14 08:41:03.818736: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - stopped
2020-09-14 08:41:03.819730: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: nonce worker - stopped
2020-09-14 08:41:03.825694: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.840197: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.847371: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.855323: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.878184: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.893093: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.907008: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.923906: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.924899: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.925894: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.929869: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.930863: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.937820: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.939809: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.941796: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.943784: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.944779: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.946766: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.946766: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.947760: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.948754: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.950743: [TUN] [lhirisseccom01] Routine: encryption 
worker - stopped
2020-09-14 08:41:03.963663: [TUN] [lhirisseccom01] Routine: handshake 
worker - stopped
2020-09-14 08:41:03.966645: [TUN] [lhirisseccom01] Routine: decryption 
worker - stopped
2020-09-14 08:41:03.969627: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - stopped
2020-09-14 08:41:03.971615: [TUN] [lhirisseccom01] Interface closed
2020-09-14 08:41:03.975590: [TUN] [lhirisseccom01] Shutting down



On 03/09/2020 14:35, Simon Rozman wrote:
> Hi Peter!
>
>> [Interface]
>> PrivateKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
>> Address = 10.2.80.226/32
>> 2020-09-01 09:20:21.374673: [TUN] [lhirisseccom01] Setting device v4
>> addresses
>> 2020-09-01 09:20:21.445471: [TUN] [lhirisseccom01] Listening for UAPI
>> requests
>> 2020-09-01 09:20:21.452451: [TUN] [lhirisseccom01] Startup complete
>> 2020-09-01 09:20:21.461427: [TUN] [lhirisseccom01] Unable to set
>> interface addresses, routes, dns, and/or interface settings: The object
>> already exists.
> You don't happen to have a TunSafe created TUN-Windows6 adapter around with 10.2.80.226 IP already taken, do you?
>
> Regards, Simon
