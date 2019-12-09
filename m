Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32AC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 21:54:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E13205ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 21:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sEtIbeDw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E13205ED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d00ca211;
	Mon, 9 Dec 2019 21:54:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6401a8fc
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 21:54:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdf493d2
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 21:54:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58e49544
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=tJm5XT+Ludr6eQnwRaNB/y3k7Vs=; b=sEtIbe
 DwxGJcOiPq3fjzDmK5gslGhzudZFsZs3RUmdvSs+TqSHPOudzMzobwN4JF1dPWCh
 wePqsddiUvdlKhIcJtCsXQWu5EIUX2DgHjb79JLm92/b9Hal+lkvy/UAXVtObzvh
 WdUEc3Ogkt98KaglcyDEL/9Kf6/eoj4LgPJ3O/lYCfzUU0wWj8hxuyBNHFDyZ8jV
 0kKNmionoc9pE+VdbQ7+zaILZw4XYKiDLUCKJPC0huUm1n6obSUIdADDieioSSue
 mwG+KMr072O9qpSoW5FpGrNuaOH/wS2XFtKjWBaYXnElQoFN3jmlUnHm2NfN7Le9
 npR5F4Hx99pWBPqQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c25d7039
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 20:58:56 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 77so13653424oty.6
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 13:54:23 -0800 (PST)
X-Gm-Message-State: APjAAAVotKnmjA7sLgk3Amw07wPu4fG5hrYxZTfFl8XPRqL6atZIn0EI
 zWMYqrDT46dnO97OWsa2zEe4S+NfI+kneOOuA+o=
X-Google-Smtp-Source: APXvYqyXDoxA4CTDl+oUgs739RhQFH1E5LPKFVtFZPoTefPMf6Pd1doevCmNPmciqmvDjGdbjgS9u9gwh629fTNxDeE=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr24299764otn.369.1575928463182; 
 Mon, 09 Dec 2019 13:54:23 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9r4mgUzrqxJ7vEJZLqG7UVnQjAKrJSpDDF8h0hr7hnYBw@mail.gmail.com>
 <20191209195339.11817-1-seriv@cs.umd.edu>
In-Reply-To: <20191209195339.11817-1-seriv@cs.umd.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Dec 2019 22:54:12 +0100
X-Gmail-Original-Message-ID: <CAHmME9rViQ3Qru-_yQsOii09Bhi8XCS-ve39Lna4fcqt9QU4WA@mail.gmail.com>
Message-ID: <CAHmME9rViQ3Qru-_yQsOii09Bhi8XCS-ve39Lna4fcqt9QU4WA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Support building for RHEL-8.1 instead of RHEL-8.0
To: Sergey Ivanov <seriv@cs.umd.edu>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks! Merged:
https://git.zx2c4.com/WireGuard/commit/?id=77da189d3399ca4e6c8f016726b6fc3b5dfe91cd
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
