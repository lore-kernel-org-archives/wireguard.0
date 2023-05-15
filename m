Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A7C77B75
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 May 2023 20:20:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bbf7fbe;
	Wed, 17 May 2023 20:20:57 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ccd65dbe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 May 2023 18:04:39 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-757742c2e5fso851151085a.1
 for <wireguard@lists.zx2c4.com>; Mon, 15 May 2023 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684173878; x=1686765878;
 h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UHeuGNv7zZWjAGdmRokJhSsAWEio6KEpGBfXOi+nMXU=;
 b=LpEKG+eE9CSr1LwcwDVEIQ9OFSqwRtNkG21uSpwrnvd9nejIw1sWOYg5cnceG0lX3h
 ZQhGP8ziLGo9d8neGMKKcYRt+zIfJ5GC8pEDS4xOt27xsHNUnGG9+De2ucDkRGTokzpG
 tLnGcxdJ1aigeG06Z1zkUJ+xm/ZaaJjf+Mew71gKT/inM0XxsjRWulHiT4hMQGv2IEhD
 x1le7vY8aNQcmpmrNBJ8SJuB66sssEQMu9G305c7Kj255ajDZkSyCIKWO+jkDOBd2pJ7
 2zKM8hHcjh47AEcJwwv1mYwLP7KxmwkRfgphPWhKsBhaTY91rWsF1K3l+AnXiP9GCvLm
 raaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684173878; x=1686765878;
 h=mime-version:message-id:date:subject:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UHeuGNv7zZWjAGdmRokJhSsAWEio6KEpGBfXOi+nMXU=;
 b=aVwCU+iQ+G0hARHnsCi70iuy6QgsG0VcNqMhmE2vfs+7eXOlutXBraNndT1L275uZB
 nBqypI9uxw2elpTtP9DIXK1BW/DETwp904WB7eL7CREmNr+NHcv3CX43WkNOVDrP3uJ2
 ypKrw9pk0XPU738B56j0koew6Mz3yp/DaRwKJucMcdUQD3AJ5bznRRNEb4sLFMwe/qip
 Nnm9EOgJUAJLxQtg32ATUEMBxJLMYkzQkOOH/4S6U5Dguuy1PwB+XlprW+ihPHISoSoH
 MKnmjToN8oxF4wz2OW/3Y2y8uDhV6rnbInRn6Pi6Sz+jyDiasVoAwQgCp3+ZkF+QMqwi
 GRLQ==
X-Gm-Message-State: AC+VfDyUMVJcwPQP2m+KGCSzPlD+W7c29dHwwXmongAY9tobEljw3ooB
 6sCL2AnOt17ff8ucqjRyDGhj+FET9WA4amu8
X-Google-Smtp-Source: ACHHUZ470aNQunwoqOmA1BGsYDVK6HPcjqfZU5qet1UEyPi9l3zlGDbcplmwYCNnuiYFreYCSPxmfQ==
X-Received: by 2002:a05:6214:2a8e:b0:61b:9e0f:93c2 with SMTP id
 jr14-20020a0562142a8e00b0061b9e0f93c2mr47315809qvb.49.1684173878074; 
 Mon, 15 May 2023 11:04:38 -0700 (PDT)
Received: from hurd (dsl-205-236-230-106.b2b2c.ca. [205.236.230.106])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a0ce1cc000000b005dd8b934579sm5068325qvl.17.2023.05.15.11.04.37
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 11:04:37 -0700 (PDT)
From: Maxim Cournoyer <maxim.cournoyer@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [bug] No keep-alives sent when private is set via PostUp
Date: Mon, 15 May 2023 14:04:36 -0400
Message-ID: <87fs7xtqrv.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 17 May 2023 20:20:56 +0000
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

Hello,

I've encountered an edge case where no keep alives would be sent
following recreating a connection with

--8<---------------cut here---------------start------------->8---
wg-quick down my-config-file
wg-quick up my-config-file
--8<---------------cut here---------------end--------------->8---

Where my-config-file contains something like:

--8<---------------cut here---------------start------------->8---
cat /gnu/store/zilv4f0jqa8nz8apqv8y3a6g0ifymxhc-wireguard-config/wg0.conf 
[Interface]
Address = 10.0.0.7/32
Table = auto

PostUp = /gnu/store/4cnl0h79zc599xryr5jh66d7yq643zk4-wireguard-tools-1.0.20210914/bin/wg set %i private-key /etc/wireguard/private.key

ListenPort = 51820

[Peer] #apteryx
PublicKey = JPWIbC9qMlnTkWfqGp0plOxWJ/ewOO/C9BuxIJles28=
AllowedIPs = 10.0.1.1/32
Endpoint = apteryx.duckdns.org:51820
PersistentKeepalive = 25
--8<---------------cut here---------------end--------------->8---

The following command on that machine:
--8<---------------cut here---------------start------------->8---
tcpdump -n -i any port 51820
--8<---------------cut here---------------end--------------->8---

wouldn't show any traffic.

Discussing this on #wireguard (libera.chat IRC), the another| user
thinks the problem could be triggered because of setting the private key
in using a PostUp directive; more specifically it is believed the
problem would happen when "no private key is defined when the interface
comes up".

-- 
Thanks,
Maxim
