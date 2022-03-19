Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35E1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 00:45:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9a1c760e;
	Thu, 21 Apr 2022 23:50:27 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1d908cb5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Mar 2022 09:04:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so6549398pjm.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Mar 2022 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:reply-to:user-agent:mime-version
 :content-transfer-encoding;
 bh=TK0YadH1UO3y8FatK4Oidj0OWTcZOktEo/ttjkEwYLk=;
 b=oqpJ7rzwKllE68g6BR78Yni9ZRX239UQQ7EdUw/i/tWeWVJSfkFyOqcJ2uozFHESqx
 wk4s2LG6y6AZAyyai+6k4OpOu7RYrMWa/Zz0YZjFCZ7QNRQrsYAOJ++mh+0Xt8E4ovkr
 fPt/Cs5FeXS/ml519goSB2dEGUZvjv4XuV+zpdOi4VDVWAvfj6Tz8CaAQRA7EqlvMZmj
 3Im6mfz1pj4cgBk5K3Lxhj9uBKSgDAxxFtrUPnzCT2o6i8W5peF18ATr6enYjc5MGKyt
 VsExlacSgSFOtwQ6C6amT3jZuSJsi6HWvUe4nMTp2OS/Cc4vjWDyjIZz9UIFQadE7YFj
 roRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:reply-to
 :user-agent:mime-version:content-transfer-encoding;
 bh=TK0YadH1UO3y8FatK4Oidj0OWTcZOktEo/ttjkEwYLk=;
 b=d3sME+tAn1vg5asngie2nBItMZQfYtaM1xflt5HOs9AG6OBLVL7rQYhN+S8Tz0dnYR
 ZDo2fu8BlfjtGh074YW+KndLJnPVIrFTeIvyg8iydV3LH6KCDQgByGYgQHNLck/B5IjF
 htGT2rJaBhJkswMvwBpU2RmRexWH447diD+XDPpcGgWqPB7+Ld+Qe894LVms7Dyv7zOk
 It/lSMYDHX7ufQJResc7IZEsdK3rAVRfNFvUODyZaIsq999X2ua29iEoPW9mWfHC6HsE
 1ITp3v7ePcfJYXyoW0MZG887OsLtm/0rhQwdaxMleOxFx2E0XVr6tu709c+ir7b1b9Xd
 P5WA==
X-Gm-Message-State: AOAM531psi+zS3jwMLQz2j70/wJa2W++RSlg57V5djISUCdMdxHx/xY+
 YWU+zi6UouARnRBzLBLA6uL6yDnKLylDXg==
X-Google-Smtp-Source: ABdhPJy6J6n7e03n7oYkQtrpPo09cQq6FwwKPJwULR9XNQAqwzwCGzAOiqGnRytiGUoetHH/ixLdvA==
X-Received: by 2002:a17:90b:4f92:b0:1bf:25e2:f6af with SMTP id
 qe18-20020a17090b4f9200b001bf25e2f6afmr15521785pjb.98.1647680682558; 
 Sat, 19 Mar 2022 02:04:42 -0700 (PDT)
Received: from [192.168.99.100] (38-34-127-72.starry-inc.net. [38.34.127.72])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a63384e000000b00366ba5335e7sm9502825pgn.72.2022.03.19.02.04.42
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 02:04:42 -0700 (PDT)
From: "Michael Adams" <unquietwiki@gmail.com>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Anyone working on fixing IPv6 name resolution in the Windows client?
Date: Sat, 19 Mar 2022 09:04:40 +0000
Message-Id: <emce1a687a-ef9c-43f6-9d66-638b66aed36b@6afb5539.com>
User-Agent: eM_Client/9.0.1361.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:50:26 +0000
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
Reply-To: Michael Adams <unquietwiki@gmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I've been trying to make a report about this, and not sure if I've=20
successfully done so. It apparently has been the case for some time that=20
the Windows Wireguard client will disregard AAAA DNS records in hostname=20
lookup; specifying IPv6 addresses as a host does work.

Thank you all for working on an awesome VPN platform; I've found it to=20
be incredibly useful.


Michael Adams
https://unquietwiki.com/

