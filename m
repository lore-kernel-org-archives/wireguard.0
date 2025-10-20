Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B447CCD193
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Oct 2025 19:23:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12350e72;
	Mon, 20 Oct 2025 19:23:06 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f0ff188
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Oct 2025 19:23:04 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-930db3a16c9so452274939f.0
 for <wireguard@lists.zx2c4.com>; Mon, 20 Oct 2025 12:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760988183; x=1761592983;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gx5+jMfXS8QttnO51LCTqUVXKqKMLZYlDxYkmZC2KJ0=;
 b=JdyrvCONCkg03rNOIUoLbs2vHVwqaxpWQerwCgsznYTnyY63xZGoc6lxaDhMAmOBiA
 YZhsWTeOCw1MBLIowoyfNy4B0q3Rbi0+2X99M3SkYG7bqcIzP/w6QXyRxPQXuJbLNPGG
 yAKJxdSqZ8hwBhfZrvLrwJLz4QbzN5OaTdNgfxTmq6sPTG5c31LkP3s1Vc72Nl2/lHdK
 TK0VyyItIC0c3YFrAUb9CRnaHv7UqXyC7p1PVo/sU+veTc5OLFIodXcjIGQTZmvoHvE0
 XboQg1y+N9BS4a5LgIqAWD1B4xvjRefM4Tk5X2gcmw9P1PXwt5pzqyPiChrGn/nqxbRF
 Rr+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRiBV8uzMw32QHJh8Hdymfe8n7ka2paNSCFa6JrsTWH0DyaVk0kfdTTSq8ykb4ucf+nOcruEB5QZU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzNMRHMhbTmFMeXurHYoeGdrgqcCNnoRctabjHDmYsM2wmTXeEI
 1Ey8yfujIXcDwIRGDCyiOjo832AgkhY64VfIj30RZChYNTXns3YdbGI4YZmOO/a4hCA/KYEuuN+
 IYFi6a6GWuoJLdn84NN0Xe+/bZhsfpkkHtXfSarl9iD0LCkZr94urw0wyby0=
X-Google-Smtp-Source: AGHT+IFiF2OvAuC5QiClzfK5zQLICkuwY9oBGpgO4Iv+mjNYaRXnNM8sd6VyjYsy7j6YhUc3a3RsitQ70ua24+lFfcnUI0x44h/n
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27c2:b0:936:eded:d78a with SMTP id
 ca18e2360f4ac-93e762b3ac7mr2214491539f.6.1760988183172; Mon, 20 Oct 2025
 12:23:03 -0700 (PDT)
Date: Mon, 20 Oct 2025 12:23:03 -0700
In-Reply-To: <66f49736.050a0220.211276.0036.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f68c17.050a0220.91a22.0450.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] INFO: task hung in wg_netns_pre_exit (5)
From: syzbot <syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, andrew@lunn.ch, andrii@kernel.org, 
 ast@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
 davem@davemloft.net, edumazet@google.com, hpa@zytor.com, jason@zx2c4.com, 
 kuba@kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com, 
 netdev@vger.kernel.org, pabeni@redhat.com, sdf@google.com, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 wireguard@lists.zx2c4.com, x86@kernel.org
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

syzbot has bisected this issue to:

commit d4dfc5700e867b22ab94f960f9a9972696a637d5
Author: Andrii Nakryiko <andrii@kernel.org>
Date:   Tue Mar 19 23:38:49 2024 +0000

    bpf: pass whole link instead of prog when triggering raw tracepoint

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17ccbc58580000
start commit:   88224095b4e5 Merge branch 'net-dsa-lantiq_gswip-clean-up-a..
git tree:       net-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=142cbc58580000
console output: https://syzkaller.appspot.com/x/log.txt?x=102cbc58580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=913caf94397d1b8d
dashboard link: https://syzkaller.appspot.com/bug?extid=f2fbf7478a35a94c8b7c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10796b04580000

Reported-by: syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
Fixes: d4dfc5700e86 ("bpf: pass whole link instead of prog when triggering raw tracepoint")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
