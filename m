Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF050C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:15:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49CD52081B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UEi/ePZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49CD52081B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 367aa7da;
	Sun, 4 Nov 2018 17:10:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45bbfbd3
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:10:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a08403f
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:10:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1beaa839
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=3uO0jYIN6ze5VDOBC3KWTGVhrr4=; b=UEi/eP
 ZpDdkFixshfhxpffMKm1Nc2B28jKPVcYTfJEPwVVFb8zv/7NdJ/gKLPLev+0a+/t
 lTxMKwr4kOAEXWOGZFTVlC+oG5nnE5MagNUrx12mX5KJUIKeLdxEtT93Et0+WTt7
 IAbPloX0U/DDlNlJ7WSXOiAQb2vR0HESadXXHM/bNv+Vjjz8ddMUqP+NzQ44Qd3B
 4hili7P3/Ca441Llp0Xxh3TfjUgUkFJcLHoAA+K557cAe1pNDyOl68KFif73ZVoC
 WVMly2WX+o56I0tU4Hr8xoJdaPZ4lOEtuHQN1O34cAPK2LvNHlMK1boOnUXLaGJn
 q66sMnFvud6lK64Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e1355ae
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:10:36 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id z33so5783311otz.11
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 09:14:44 -0800 (PST)
X-Gm-Message-State: AGRZ1gJHjTedFSt7MZwEB6WGONiGWr6Au4Xz4AJBQzPs3nG8B0nSXXNn
 EptOj1KkU35uNx3cvCXBGgdG4xA7bJWlOMPiFEs=
X-Google-Smtp-Source: AJdET5fq8QPOkrFO1T5WPGZuGSWAF9sE7nXBrDqPZ2ZYrFnFkR+VV7wKY6EOUK3PvF2q4pN5Rhj1MQfID/aJbGDSog4=
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr12219396otg.223.1541351683812; 
 Sun, 04 Nov 2018 09:14:43 -0800 (PST)
MIME-Version: 1.0
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
 <20181102113952.7af2e414@note>
In-Reply-To: <20181102113952.7af2e414@note>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 4 Nov 2018 18:14:32 +0100
X-Gmail-Original-Message-ID: <CAHmME9rp1hX-GNYy-jqc7KcNp0xLph67mpmrnZZkyeSNWWz4hQ@mail.gmail.com>
Message-ID: <CAHmME9rp1hX-GNYy-jqc7KcNp0xLph67mpmrnZZkyeSNWWz4hQ@mail.gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

We're just waiting for f-droid at this point:
https://gitlab.com/fdroid/fdroiddata/issues/1398#note_114318645
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
