Return-Path: <SRS0=1inu=HO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B2BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Feb 2021 16:50:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD18964E42
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 12 Feb 2021 16:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD18964E42
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c6fba60;
	Fri, 12 Feb 2021 16:50:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 00565abb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Feb 2021 16:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613148647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=2EMZ+rG4G4lOebt2pe1qRJJR3zAzFuhxyduZ9SXVnN0=;
 b=peyyyMKRm/49OrAlX3YqNqP8w9jIXaPFKLE8xGPG5sYUEOKV+GnOXdmlRRLLwutle7EO+d
 m8jDKS3PkLzp8PWVJ/BJ0YoY4Ku9yBz3o6Ec/2ND9731kblmfTI3iXbSOZypkc0DxW6BRs
 fIrrhe13ziPsq5QMZEn/OpOxtND23MU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2ec91d4b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Feb 2021 16:50:47 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id x19so86480ybe.0
 for <wireguard@lists.zx2c4.com>; Fri, 12 Feb 2021 08:50:47 -0800 (PST)
X-Gm-Message-State: AOAM532lZ+Ml21KKwq971RMCrWZo0Hb7UHNCoT5NRr7ESXhYDUNG5lHv
 CzO3rc8Vq4QFysT1XOrWIOfjZdHZa8eczUg4iR0=
X-Google-Smtp-Source: ABdhPJwHJ5LjM/zfNxn59WLSVz9NZySaFgjuH8FL3b4azkANa2hMMC4in6HfeNc/q+gSt1GMv7aQGKs0GXou/M5hSrY=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr5511427ybm.20.1613148647045; 
 Fri, 12 Feb 2021 08:50:47 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 12 Feb 2021 17:50:36 +0100
X-Gmail-Original-Message-ID: <CAHmME9pVX7AOFuPD8kZZ8nptFS7ZwL78POj-Ch1qHyCpLYJr8A@mail.gmail.com>
Message-ID: <CAHmME9pVX7AOFuPD8kZZ8nptFS7ZwL78POj-Ch1qHyCpLYJr8A@mail.gmail.com>
Subject: com.wireguard.android:tunnel moved to Maven Central
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Harsh Shandilya <me@msfjarvis.dev>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

Ahead of JCenter shutting down, com.wireguard.android:tunnel has moved
to Maven Central:
https://search.maven.org/artifact/com.wireguard.android/tunnel

If you previously had in your Gradle:

repositories {
    ...
    jcenter()
}

You can now replace that with:

repositories {
    ...
    mavenCentral()
    jcenter()
}

Or simply remove the jcenter() line if it's no longer needed by other
dependencies you might have.

More information about com.wireguard.android:tunnel is available at:
https://git.zx2c4.com/wireguard-android/about/#embedding

Information about integrating WireGuard into other platforms is available at:
https://www.wireguard.com/embedding/

Thanks,
Jason
