Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98197C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Apr 2022 18:59:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 27154e8a;
	Wed, 27 Apr 2022 18:52:49 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a84ca7c3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Apr 2022 18:51:11 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id v4so3834786ljd.10
 for <wireguard@lists.zx2c4.com>; Wed, 27 Apr 2022 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=X1V6hgDwYU1Mt1xt8aZNqkunKKrVkE5RgOciCJzloRQ=;
 b=dMstIZacVSbaBYHV4lf5ZX3W+yN74tbkTaEFFkHhh3XJPeoupSuGvti1SFn8IwGvm1
 aIPqv+e0EzL+OKGUodElCNRjn4lWFyDBMC7fVbDPD/IGyLI0FjHhW1RBRiBulvpa/6iC
 Bj96YR9Nw+FznSY+0jXhIMVpWfABn8qvL84YB4YhEdpCi2oJf/NlX+USQz2ZncZMtkjC
 GCTlwOmZ7JvnGbC2YLtjwNJKf7IiIAC4reFSttl3e/zVQ/gxFudnVtWeFofg1uUWf1eR
 HcIwwDMgquG+WapfHFhnQO6FbZJeWkfQqiewvfZvYWc/VWp61Jt6SQYf1iTM9SiXEcf/
 GKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=X1V6hgDwYU1Mt1xt8aZNqkunKKrVkE5RgOciCJzloRQ=;
 b=YzB4NYcKI/LhrZehZ1UrZ//mxppLjcEnCktS65sLj0xnhRwwPQmvPefLojd5aFTuCn
 zwfNNjxWyomg+YcjOgY3H+ESVMsJ9fKq9HJooXH5U/3nmH2+fgxavmEGcXyi5TdlF5Oj
 l4puTb0/8MGmfXwpbWP3zMHamQYjwtcSqFaUJoplKi3eSH+nw5nDZqKdAo3M5yxzSCHo
 NjS8nhNXmGC5zqY3acgCUsitraglXOgDRkOEkeChkPVYY0gOeNwKJJZUoDwpt6XSLfZU
 aMFAUw9qbi1oo+uzRNqutc2KigbEQaPxz+WdiYkSq6CgSrxGC7nXCsWKfFvl3AOlaUMD
 bA8g==
X-Gm-Message-State: AOAM532r7Sst9YvFjphoDEoyEBM4PFhP0vfVoJqzaHK//GEqUedJhkZS
 mLbT0Z1vjT0eiiypqy3crdtxgiCt/hd41XnCGJhzmuvJwQRKgQ==
X-Google-Smtp-Source: ABdhPJx8NPtxVQUpbijIsbYckURcrWmzv8/KMNMlp4HITSKAClDJJQoWDWWnF2m/ZAESnOL9WfcXhaH5LvC7yby4lX4=
X-Received: by 2002:a2e:a54d:0:b0:24f:631:ed47 with SMTP id
 e13-20020a2ea54d000000b0024f0631ed47mr14598079ljn.372.1651085470857; Wed, 27
 Apr 2022 11:51:10 -0700 (PDT)
MIME-Version: 1.0
From: Pierre Grimme <gamedev.pierre.grimme@gmail.com>
Date: Wed, 27 Apr 2022 20:50:58 +0200
Message-ID: <CAHjGJ4PPALxp8x5kCVFb3a2_0CydJF2CzP0LdFmnZ7YfCh4MRA@mail.gmail.com>
Subject: Feature Request: Configurable Re-Resolving of DNS Endpoints
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 27 Apr 2022 18:52:48 +0000
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

[Situation]
Using a Domain as Endpoint on your WG-Client to reach the server with
a dynamic IP address breaks the connectivity when the server changes
its public IP address.
Wireguard only resolves domains once and uses from there on the
resolved IP address. This is a huge problem in the private sector,
where static IP addresses are not common. Even worse is the situation
with Dual-Stack-Lite configurations, where your public IPv4 address is
not reachable from outside. You have to use domains pointing to your
current IPv6 address to get connection to your local network.
The end user does not understand why the connection is not working
anymore, especially on mobile devices. Also, a workaround with the
re-resolve script is not possible due to lack of system file access
and permissions. Private internet connections are force quitted every
24h. More often if something goes wrong.

[Intention]
There is an open-source project called netmaker which builds meshed
networks with wireguard vpn connections. If you try to self-host this
program on your private internet connection you need an endpoint
address which is static. The need here is to input an address
dynamically via a domain so you could always reach your server master.

[Solution]
The solution would be to re-resolve the endpoint address from time to
time. The big benefit is that your endpoint IP could be dynamic. Your
domain can point to a cname, a or aaaa record, which would enable
people with a Dual-Stack-Lite internet connection a "stable"
connection. Due to the concept of wireguard to be minimalistic it
would be perfect, if the feature is off by default and only turned on
when you enable it in wg-interface config. It would be great to have a
configurable parameter e.g "dns-resolve-duration = 10 #in seconds"
The solution should be usable with all available wireguard clients.
