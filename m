Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD15C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 23:12:23 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 32d80360;
	Wed, 29 Jun 2022 23:10:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cccd20bf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 15:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=u75BnaIZv65/D4EtnoVCQK9Jy3Yfc8PqQDHXzj1JaKg=; b=yApMYDtp8LWyJtG39X2au+AsJo
 /cKHe+qyb1wDCP3Apqwuy5zoX3WnUz6vNM7x+YAmmSSaU0wJtCsc288u6ZgUFe4bx5qxHlQpPH2JE
 H+wyMsM6DeIYkdNnYCH33MF+4/mgmbNCxVUVoxRnLinaCo/2E36hEF5IuXtPDkmgNkCSUCr9VatQx
 UCeEH/o+5yzT3m6My/YdO4zmx1mTrjU0Ggg92m5VJkwWVWEM+sXjRKFjGROqbDqR+/oPeoK8IHfFW
 9ttqronmDisFehvosbJWnXpCwekNmlIBjpNolrIPQUses1kHAV5gbWRPGsWYAMNImCo+TjYafpP9Y
 yJYGt/BQ==;
Received: from [2001:4bb8:199:3788:eb09:6317:6452:5395] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o6ZBh-00Ccg4-M7; Wed, 29 Jun 2022 15:01:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Neeraj Upadhyay <quic_neeraju@quicinc.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, rcu@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: remove CONFIG_ANDROID
Date: Wed, 29 Jun 2022 17:01:01 +0200
Message-Id: <20220629150102.1582425-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 29 Jun 2022 23:10:40 +0000
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

Hi Greg,

this series removes the CONFIG_ANDROID.  It just guards the Kconfig
option for binder and then changes a bunch of random defaults and
settings, which makes no sense whatsoever and none of those changes
had any good justifcation in their commit logs either.

