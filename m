Return-Path: <SRS0=Qc6R=BQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4DAC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 03:02:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E4542177B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Aug 2020 03:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsDNxPza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E4542177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5fc7b5f9;
	Thu, 6 Aug 2020 02:37:36 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bcba5cd0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 Aug 2020 02:37:33 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id z20so6025793plo.6
 for <wireguard@lists.zx2c4.com>; Wed, 05 Aug 2020 20:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=gwPdTuKdSpbESSv+oOUCMmSkVoCjvQvwOZE4vZn54JQ=;
 b=qsDNxPzarUGopqE3YXveMAs84YCxHP3jxwhEcIldm4fsqPM9mmsgcQQUo6ZQY9CJZu
 n62HYbBBXpAeyBBBOfpEIvYAblC+0/rGj8kUE9YFLmTc3cnT6Nwm0vBzTqv0fWTeeyi2
 cdFRyGJVLoNIyUlTfXW/vb2PPzRyikl9VD6i9krek9muacLx805dUTqLi9Wb11+dGedC
 3PpaAqnNBK+bATBq5EUPXb/2gNsgJGjI5x3tFEAazRqFwzJNLBSoFitlEW0bFzjlzwEW
 eEd3/iBJiUvSBFC0PEXCCp0DSEgjata8banmsUroL51Qfjdj6dvtnWNmgxcGMD/fU6M+
 mpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=gwPdTuKdSpbESSv+oOUCMmSkVoCjvQvwOZE4vZn54JQ=;
 b=cDN5WHdbOFpEpv5P5zpWeEXy82HKnqB5nW5wcvBomYeHky264w+mfrnt0nnNaztYAJ
 ybL8bQ46YRaqJXbMdcZyKiMlBYtu4hMEYCBEtQol1849xBWWTwxcYfaPOXnhrtRPIU0T
 IUvuctAKVWrqBDvzPKowz6hTrCapo2YFskY7LljZzLQk8H7ovovoMRAF2wPC4AntssKQ
 F8FQLq2QIBkQ34AsmHd+QT0UObSylLEmlUqVleQnaFsfTx9Nm0tBdHeDOdLwSuinz9li
 kIr6eNZZ1pBnI+DubbkS64xJzHtViOs74/hUCezXGWw0zaETe3ttpE6Dg/1LBZ28QmsU
 24fA==
X-Gm-Message-State: AOAM532UPokO+fR+BHKEmUfTaVYcJPJ1aUlg0JtcozYGSgJJsrqYu6to
 xuarrLANHsvBteTPtUKfa9Q3XvS58Js7peoSNoy4du1NInk=
X-Google-Smtp-Source: ABdhPJxoEN55BRKHQV/zDPbIkLA/QvbVqKEwejtW2iwHqGfZPwq/Ueu+zzgDXJOMz/EZUit4VNb3Dax2i/oj6U7dgaM=
X-Received: by 2002:a17:902:d881:: with SMTP id
 b1mr5743207plz.74.1596682926161; 
 Wed, 05 Aug 2020 20:02:06 -0700 (PDT)
MIME-Version: 1.0
From: Mo Balaa <buddybalaa@gmail.com>
Date: Wed, 5 Aug 2020 22:01:55 -0500
Message-ID: <CAKmhVkr2xZNocRzq76eOk3xCmoPh3bpiPongu0dUJesJs2DH-w@mail.gmail.com>
Subject: Noteworthy: Self-hosted made easy,
 secure and private. Powered by WireGuard
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello fellow WireGuard enthusiasts!

For those of you who are also interested in privacy / self-hosting
please see my project:

https://noteworthy.tech/start/

We propose a general strategy for WireGaurd based hub and spoke
topologies to enable blind TLS proxying for collaborative self-hosted
online services.

The project is quite large in scope, but what I think you will find
most interesting is that we use WireGuard to enable a Federation
capable Matrix home server, without needing to expose any ports to the
public internet on the server itself.

Matrix is an open standard for end-to-end-encrypted messaging with
mature open-source client/server implementations that works well as a
private, self-hosted alternative to services like Slack or IRC.

Comments, feedback, contributions welcome.
