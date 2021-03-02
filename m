Return-Path: <SRS0=upWG=IA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1,
	WEIRD_PORT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88F0C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Mar 2021 08:03:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2A76146D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Mar 2021 08:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A2A76146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a0c8ef2;
	Tue, 2 Mar 2021 08:03:41 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 46cec47c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Mar 2021 08:03:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id l22so1419200wme.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 Mar 2021 00:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:references:to:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=CUBkCtbC74tYDXxkLguFyrulmByn9uQGDfBTJ+ASidY=;
 b=Lm130mCsm5cAi9wxdMOuwQHbVqsJ2wVsLpExSPYhzPunhOckYFHob29rSADrffp/vD
 kVtJ05jxIuiBOJJhFdRCbV6RzFLzVV7oTqRANXpS1AR8+Ee4rZ6ij5u3RvFJgEnreZ5j
 iM42kbsYV4MQW5gkracWaRJoReN36TpPyx+lZs+6iX70u6EodLn51F1v7RHP4GSAMDXU
 T/by51nc0pslkl6kFrm0Xku3bJWffp2mzP1IfznpjJhmenw85kHyLdLmGqS2zRwmbb3L
 7nDeVq53VdIyzBoqgfXyh1LMhAQoyNcTMmY2RMcO4Lbyaq8UjSqYTEMCVZq3xeQPKal/
 UAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:to:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CUBkCtbC74tYDXxkLguFyrulmByn9uQGDfBTJ+ASidY=;
 b=RfUxIqFXlHv6H4yqsc4ghfcq4meS8PPfsH2pzCjjs2XqDr4kzyqDHQeP2zSxPpSID1
 upl9tqYBzAymaUuXSxUlkPTbsIuaqaIxUXXhqK2aspHxmBXVKsqWLuE/znhjOM1P/Bad
 n6WQ0YDvrze8C0MA+fRar6U0B5lAooYJhTI0+HbYcC6zHgAO9RacEqOHZHcAWiZKHiF0
 t9MOXuUcDxvZI8JcOVre8z94H+E++KxcnImqRcekEnHYmNfgu0Pw0AMtre4AK9ZFxP+I
 FTQk/g8o3QwFh+1eOuBmjMPwdT2CguawiwsjEOF2my8pFaAR81u/8poCJSHLWlGK0IxT
 N2UQ==
X-Gm-Message-State: AOAM533ujPrFl2bBZdtLbKBwtRhUOUilbSysqBoQtbne4X9n5ZQy90Nh
 lkDy1ocpUcYvK437fbyjP82eiwSNcoA=
X-Google-Smtp-Source: ABdhPJzCiID6wKhDkbY9f3tq1QlTu6LLgk9b8xhxO8GoEjqavPgXGy9YjdwrVOqQqC7k2S1KRi7MdA==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr2671280wmq.160.1614672219772; 
 Tue, 02 Mar 2021 00:03:39 -0800 (PST)
Received: from [192.168.25.202] ([95.151.188.4])
 by smtp.gmail.com with ESMTPSA id y62sm2252960wmy.9.2021.03.02.00.03.39
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 00:03:39 -0800 (PST)
Subject: Wireguard Win10 Client not work through an openVPN tunnel on the same
 machine
References: <CAL5yamu4tnxCS58JbTqPtO4W51CdieZ_S0ntk7VNRV044mLmcQ@mail.gmail.com>
To: "wireguard@lists.zx2c4.com >> WireGuard mailing list"
 <wireguard@lists.zx2c4.com>
From: Peter Whisker <peter.whisker@gmail.com>
X-Forwarded-Message-Id: <CAL5yamu4tnxCS58JbTqPtO4W51CdieZ_S0ntk7VNRV044mLmcQ@mail.gmail.com>
Message-ID: <115f4409-2fee-6332-0eb9-598421d6eb5b@gmail.com>
Date: Tue, 2 Mar 2021 08:03:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAL5yamu4tnxCS58JbTqPtO4W51CdieZ_S0ntk7VNRV044mLmcQ@mail.gmail.com>
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

This may be because Wireguard binds to the default route interface which 
is not correct if you want to use another route such as your OpenVPN. It 
also fails with PulseSecure VPN.

As discussed here in the past month, removing the code which binds and 
recompiling Wireguard fixes the problem.

Peter

On Sun, 28 Feb 2021, 22:17 Heiko Kendziorra, <kendziorra@dresearch-fe.de 
<mailto:kendziorra@dresearch-fe.de>> wrote:

    Machine A in Intranet Windows 10 Prof Version : 20H2
    Address 172.1.2.3
    Firewall is open for  webserver und wireguard (8080 tcp, 44444 udp)
    is WireguardServer  Version 0.3.7

    wg.conf:
    PublicKey = A8C8+bRYaqu2MKs2SpwuRRgmwqItYwFFJjk77UtUUxU=
    [Interface]
    PrivateKey = ********************************
    ListenPort = 44444
    Address = 192.168.44.44/32 <http://192.168.44.44/32>
    [Peer]
    PublicKey = JkacJ6IYPUgCOv+OdHN6ZMJ+JRZr6V5/kDzthil/CUs=
    AllowedIPs = 192.168.44.4/32 <http://192.168.44.4/32>
    PersistentKeepalive = 25
    --------------------------------------------------------------------------------
    Machine B extern over openVPN connected with the Intranet Windows 10
    Prof Version : 20H2  (OpenVPN Client running on B)
    Address 172.11.12.13 could reach A over Routing  (Test: Webserver on
    A: 172.1.2.3:8080 <http://172.1.2.3:8080>)
    is WireguardClient Version 0.3.7

    wg.conf:
    PublicKey = JkacJ6IYPUgCOv+OdHN6ZMJ+JRZr6V5/kDzthil/CUs=
    [Interface]
    PrivateKey = **********************
    Address = 192.168.44.4/32 <http://192.168.44.4/32>

    [Peer]
    PublicKey = A8C8+bRYaqu2MKs2SpwuRRgmwqItYwFFJjk77UtUUxU=
    AllowedIPs = 192.168.44.44/32 <http://192.168.44.44/32>
    Endpoint = 172.16.41.20:44444 <http://172.16.41.20:44444>
    PersistentKeepalive = 25
    --------------------------------------------------------------------------------

    Result after Activation
    The Client B could not estable a working Wireguard-Connetion to A :

    Protokoll Server:
    2021-02-27 10:53:02.636: [TUN] [44444] Startup complete
    2021-02-27 10:53:03.615: [TUN] [44444] peer(Jkac…/CUs) - Received
    handshake initiation
    2021-02-27 10:53:03.615: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake response
    2021-02-27 10:53:07.821: [TUN] [44444] peer(Jkac…/CUs) - Handshake did
    not complete after 5 seconds, retrying (try 2)
    2021-02-27 10:53:11.480: [MGR] [Wintun] IsPoolMember: Reading pool
    devpkey failed, falling back: Element nicht gefunden. (Code
    0x00000490)
    2021-02-27 10:53:28.626: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake initiation
    2021-02-27 10:53:33.794: [TUN] [44444] peer(Jkac…/CUs) - Handshake did
    not complete after 5 seconds, retrying (try 2)
    2021-02-27 10:53:33.794: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake initiation
    2021-02-27 10:53:39.094: [TUN] [44444] peer(Jkac…/CUs) - Handshake did
    not complete after 5 seconds, retrying (try 3)
    2021-02-27 10:53:39.094: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake initiation
    2021-02-27 10:53:44.286: [TUN] [44444] peer(Jkac…/CUs) - Handshake did
    not complete after 5 seconds, retrying (try 4)
    2021-02-27 10:53:44.286: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake initiation
    2021-02-27 10:53:49.549: [TUN] [44444] peer(Jkac…/CUs) - Handshake did
    not complete after 5 seconds, retrying (try 5)
    2021-02-27 10:53:49.549: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake initiation

    Protokoll Client:
    2021-02-27 10:53:02.793: [TUN] [test-44444] Startup complete
    2021-02-27 10:53:02.836: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake response
    2021-02-27 10:53:23.530: [TUN] [test-44444] peer(A8C8…UUxU) - Retrying
    handshake because we stopped hearing back after 15 seconds
    2021-02-27 10:53:23.530: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake initiation
    2021-02-27 10:53:27.815: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:27.815: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:28.815: [TUN] [test-44444] peer(A8C8…UUxU) -
    Handshake did not complete after 5 seconds, retrying (try 2)
    2021-02-27 10:53:32.982: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:32.982: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:38.283: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:38.283: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:43.475: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:43.475: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:48.738: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:48.738: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:54.066: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:54.066: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:53:59.148: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:53:59.148: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:54:04.459: [TUN] [test-44444] peer(A8C8…UUxU) - Received
    handshake initiation
    2021-02-27 10:54:04.459: [TUN] [test-44444] peer(A8C8…UUxU) - Sending
    handshake response
    2021-02-27 10:54:09.601: [TUN] [test-44444] Device closing

    Apparently, the only message that the server has received from the
    client is the one that was sent to the public address on port 44444.
    After that, the client can no longer send a message - but the other
    way round it can.

    Modifikation

    start a Win10 Sandbox on B.
    install the Wireguard Client  there with the same configuration like
    on B
    deactivate  WG-Client on  B
    the Sandbox could reach A over routing through the running Open-VPN of B
    under these conditions, the wiregiard connection can also be
    established!!

    Protokoll Server:
    2021-02-27 11:46:04.958: [TUN] [44444] Startup complete
    2021-02-27 11:46:05.762: [TUN] [44444] peer(Jkac…/CUs) - Received
    handshake initiation
    2021-02-27 11:46:05.762: [TUN] [44444] peer(Jkac…/CUs) - Sending
    handshake response
    2021-02-27 11:46:05.786: [TUN] [44444] peer(Jkac…/CUs) - Receiving
    keepalive packet
    2021-02-27 11:46:13.757: [MGR] [Wintun] IsPoolMember: Reading pool
    devpkey failed, falling back: Element nicht gefunden. (Code
    0x00000490)
    2021-02-27 11:46:30.795: [TUN] [44444] peer(Jkac…/CUs) - Sending
    keepalive packet
    2021-02-27 11:46:30.812: [TUN] [44444] peer(Jkac…/CUs) - Receiving
    keepalive packet

    Protokoll Client:
    2021-02-27 11:46:05.050: [TUN] [wg-test-sandbox] Startup complete
    2021-02-27 11:46:05.065: [TUN] [wg-test-sandbox] peer(A8C8…UUxU) -
    Received handshake response
    2021-02-27 11:46:05.088: [TUN] [wg-test-sandbox] peer(A8C8…UUxU) -
    Receiving keepalive packet
    2021-02-27 11:46:30.093: [TUN] [wg-test-sandbox] peer(A8C8…UUxU) -
    Sending keepalive packet
    2021-02-27 11:46:30.097: [TUN] [wg-test-sandbox] peer(A8C8…UUxU) -
    Receiving keepalive packet

    Heiko Kendziorra

