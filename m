Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MISSING_HEADERS,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56996C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 20:35:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98B9D218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 20:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98B9D218A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11f5e2e7;
	Sun, 17 Feb 2019 20:26:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de992b4c
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:56:17 +0000 (UTC)
Received: from p3plsmtpa11-02.prod.phx3.secureserver.net
 (p3plsmtpa11-02.prod.phx3.secureserver.net [68.178.252.103])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 700cb9af
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 03:56:17 +0000 (UTC)
Received: from [10.101.100.10] ([177.54.157.114]) by :SMTPAUTH: with ESMTPSA
 id vDgpgGTHJ8LgOvDgrgDowk; Sat, 16 Feb 2019 21:04:30 -0700
Subject: Re: BUG: unable to handle kernel NULL pointer dereference at ..
 (linux 3.13)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <71ef4a71-19fe-8d4e-c3a2-f704ad8e8b67@anatoli.ws>
 <CAHmME9oWg6E0PyQP0-uTC-WfN4gkYhUrd+gYTT390CnfT8ufZw@mail.gmail.com>
 <4fa3479d-bb82-033f-c177-3269ddb8f011@anatoli.ws>
 <CAHmME9q_-Vwij4YacxF4utTk7mVZ3HvKSexysj45TEwGKMUm-Q@mail.gmail.com>
From: Anatoli <me@anatoli.ws>
Message-ID: <ed9df661-4e03-5638-dace-7eeae5b4cd8c@anatoli.ws>
Date: Sun, 17 Feb 2019 01:04:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9q_-Vwij4YacxF4utTk7mVZ3HvKSexysj45TEwGKMUm-Q@mail.gmail.com>
Content-Language: es-AR
X-CMAE-Envelope: MS4wfO8YGeor/IvPSxd3uNZRDNCCzQOcLlH6AJiejfUX6Z9UgYBf5Xts/gnkiUJWHl80oZFjPR0IfCMupKVqqY8yzXkpEGliJos1fq+Q2Mrgg1VWXS1OJRiF
 p2gJyVBzd5koVrsCc87MNE2idJwS9EuMTC8gI6rhGLxUtbyEugfY6kzfZgS2x8WtchFh0qSAIN672Q==
X-Mailman-Approved-At: Sun, 17 Feb 2019 21:26:55 +0100
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
Content-Type: multipart/mixed; boundary="===============8732109032940966852=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============8732109032940966852==
Content-Type: multipart/alternative;
 boundary="------------11B7B2B7A79449937C957F9B"
Content-Language: es-AR

This is a multi-part message in MIME format.
--------------11B7B2B7A79449937C957F9B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Jason,

Thanks for a quick fix! If you plan to release a new snapshot in the 
near future, I guess I'll wait for it.

Regards,
Anatoli

*From:* Jason A. Donenfeld <Jason@zx2c4.com>
*Sent:* Sunday, February 17, 2019 00:57
*To:* Anatoli <me@anatoli.ws>
*Cc:* Wireguard Mailing List <wireguard@lists.zx2c4.com>
*Subject:* Re: BUG: unable to handle kernel NULL pointer dereference at 
.. (linux 3.13)

Hi Anatoli,

Thanks for the .ko. I've fixed the compat backport here:

https://git.zx2c4.com/WireGuard/commit/?id=e7348a19a45f4f1311df6266b654c7fc8d50f976

You can either apply that yourself, wait for a new snapshot, or reenable IPv6.

Jason




--------------11B7B2B7A79449937C957F9B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body smarttemplateinserted="true">
    <div id="smartTemplate4-quoteHeader">
      <div style="font-size:10.0pt;font-family:Verdana,Arial">Jason,<br>
        <br>
        Thanks for a quick fix! If you plan to release a new snapshot in
        the near future, I guess I'll wait for it.<br>
        <br>
        Regards,<br>
        Anatoli<br>
        <br>
      </div>
      <div style="border:none;border-top:solid #B5C4DF
        1.0pt;padding:3.0pt 0cm 0cm
0cm;font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"><b>From:</b>
        Jason A. Donenfeld <a class="moz-txt-link-rfc2396E" href="mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a><br>
        <b>Sent:</b> Sunday, February 17, 2019 00:57<br>
        <b>To:</b> Anatoli <a class="moz-txt-link-rfc2396E" href="mailto:me@anatoli.ws">&lt;me@anatoli.ws&gt;</a><br>
        <b>Cc:</b> Wireguard Mailing List
        <a class="moz-txt-link-rfc2396E" href="mailto:wireguard@lists.zx2c4.com">&lt;wireguard@lists.zx2c4.com&gt;</a><br>
        <b>Subject:</b> Re: BUG: unable to handle kernel NULL pointer
        dereference at .. (linux 3.13)<br>
      </div>
      <br>
    </div>
    <div class="replaced-blockquote"
cite="mid:CAHmME9q_-Vwij4YacxF4utTk7mVZ3HvKSexysj45TEwGKMUm-Q@mail.gmail.com"
      type="cite">
      <pre class="moz-quote-pre" wrap="">Hi Anatoli,

Thanks for the .ko. I've fixed the compat backport here:

<a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/commit/?id=e7348a19a45f4f1311df6266b654c7fc8d50f976">https://git.zx2c4.com/WireGuard/commit/?id=e7348a19a45f4f1311df6266b654c7fc8d50f976</a>

You can either apply that yourself, wait for a new snapshot, or reenable IPv6.

Jason


</pre>
    </div>
    <br>
  </body>
</html>

--------------11B7B2B7A79449937C957F9B--

--===============8732109032940966852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8732109032940966852==--
