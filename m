Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27359C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 13:16:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A94F20756
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 13:16:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP5PPFv3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A94F20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef8d1a07;
	Wed, 20 May 2020 13:00:23 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3e372464
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 13:00:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e16so3086187wra.7
 for <wireguard@lists.zx2c4.com>; Wed, 20 May 2020 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=xkrliEVbqaSkSlLbAnlhieFhyn6gD3PLZetYD8e+kmo=;
 b=HP5PPFv34KnocdJqb4xW7hzpMP73/x7/cmQQ5m83ycFKHYNnXScTzm4G+LrfhYI5UH
 Lf7pYPRRfTrgm5F6FEBGUZseqAiRZ4V5Qa7CHreqlI4Q09oShyyMa4shnWGrAx6vTL/N
 cZ5xhmhAl/x+GxZJKcxISnN5DYb/eh1irt02ebwLrQqD/ejq/vk2kzfVU6DGeIYScf2G
 sHdgYMaGJiRTC3tKK4lQmDEyRAA+5SRqX/0YUmDz0aNgne5HaWllIEbI8G+BPLcF99yc
 4SnxBWvmRu+41UEuxjdLRNsD4VgUW/TeNzA9l1LHkkiDZ+UDuS5vU1zjAij16bAcPF9N
 HjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=xkrliEVbqaSkSlLbAnlhieFhyn6gD3PLZetYD8e+kmo=;
 b=OrR+4BXc83TdaC6cb3RBL2KmDg22g9E9MvzP1QsVHG5VpSWjCYJOwOiCd9SUu8eyNx
 ij/FxzwE2tCh+6zZ5Ny7j/rj1DCFI3fjfSJ/TtMEYXXWNJNIBAhfUan7Y21wKJh970Hv
 RWJo/cmqDqVfPa4VvjxTSTBYfLTiJsQA6W1N6nxG4v85xPUQMzTM5G/rQJV2h09Y5pra
 VD6nuCEtKzfz8DCCbV4BOZUyHM1Fx+Hr2QGI/UGfN6H+AZ4USOcV5cm4kYom0+2dYAJN
 t86mqBDPYr+y6lXZ7DLBYMbGOhUWcWgGJKEikyFC1bFTutXscU5zorjSwwu1n2yhYsJR
 oQYg==
X-Gm-Message-State: AOAM531O8VxgQQ63WRufSkH7A7VCeNvcC6ncWpNzs5IgbBB/VT11g/9i
 rh9vuBh1QhYjvMj1BrL4gzse3BjO3EQ=
X-Google-Smtp-Source: ABdhPJxNaNODXx5uU1/UWHRQCK3MHYO8POmBNQvj09gLhLk/zwFsJgxDxhBh3XBL18jwhPNEIq+wOQ==
X-Received: by 2002:adf:e752:: with SMTP id c18mr4060713wrn.353.1589980488235; 
 Wed, 20 May 2020 06:14:48 -0700 (PDT)
Received: from [0.0.0.0] ([185.220.102.8])
 by smtp.gmail.com with ESMTPSA id 88sm2793864wrq.77.2020.05.20.06.14.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 May 2020 06:14:47 -0700 (PDT)
From: Vasili Pupkin <diggest@gmail.com>
Subject: Wireguard is broken by recent ubuntu 18.04 kernel update
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <e0484514-9c09-cc78-022c-54d0e59145cd@gmail.com>
Date: Wed, 20 May 2020 16:14:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

The system is Ubuntu 18.04.4, and wireguard is broken in recent kernel 
update "5.3.0-53.47~18.04.1"... not sure why 18.04.1 is landed on 
18.04.4 system

# ip link add dev wg0 type wireguard
Error: Unknown device type.

And nothing is shown by "lsmod | grep wireguard' and "dmesg | grep 
wireguard"

I've tried "apt install --reinstall wireguard" and "update-initramfs -u 
-k all" with no luck.

Everything works fine with kernel 5.3.0-51

